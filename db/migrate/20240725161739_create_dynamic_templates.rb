class CreateDynamicTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :dynamic_templates do |t|
      t.text :body
      t.string :path
      t.string :format
      t.string :locale
      t.string :handler
      t.boolean :partial, default: false

      t.timestamps
    end
  end
end
