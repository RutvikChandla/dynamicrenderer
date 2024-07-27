class DynamicTemplate < ApplicationRecord
  validates :body, :path, presence: true
  validates :format, inclusion: Mime::SET.symbols.map(&:to_s)
  validates :locale, inclusion: I18n.available_locales.map(&:to_s)
  validates :handler, inclusion: ActionView::Template::Handlers.extensions.map(&:to_s)


  class Resolver < ActionView::Resolver
    protected

    def find_templates(name, prefix, partial, details, locals = [])
      puts "details: #{details}"

      conditions = {
        path: normalize_path(name, prefix),
        locale: normalize_array(details[:locale]).first,
        format: [normalize_array(details[:formats]).first, "html"],
        handler: normalize_array(details[:handlers]),
        partial: partial || false
      }
      puts "Conditions: #{conditions}, locals: #{locals}"
      ::DynamicTemplate.where(conditions).map do |record|
        initialize_template(record, locals)
      end
    end

    # Normalize name and prefix, so the tuple ["index", "users"] becomes
    # "users/index" and the tuple ["template", nil] becomes "template".
    def normalize_path(name, prefix)
      prefix.present? ? "#{prefix}/#{name}" : name
    end

    # Normalize arrays by converting all symbols to strings.
    def normalize_array(array)
      array.map(&:to_s)
    end

    # Initialize an ActionView::Template object based on the record found.
    def initialize_template(record, locals)
      source = record.body
      identifier = "DynamicTemplate - #{record.id} - #{record.path.inspect}"
      handler = ActionView::Template.registered_template_handler(record.handler)
      details = {
        format: Mime[record.format],
        virtual_path: virtual_path(record.path, record.partial)
      }
      puts "details: #{details}"
      ActionView::Template.new(
          source,
          identifier,
          handler,
          format: record.format.to_sym,
          virtual_path: details[:virtual_path],
          locals: locals.map(&:to_s)
        )
    end

    # Make paths as "users/user" become "users/_user" for partials.
    def virtual_path(path, partial)
      return path unless partial
      if index = path.rindex("/")
        path.insert(index + 1, "_")
      else
        "_#{path}"
      end
    end
  end
end
