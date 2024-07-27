json.extract! dynamic_template, :id, :body, :path, :format, :locale, :handler, :partial, :created_at, :updated_at
json.url dynamic_template_url(dynamic_template, format: :json)
