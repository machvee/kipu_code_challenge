class CreateTemplateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :template_fields do |t|
      t.string :field_name
      t.text :placeholder
      t.belongs_to :facility, foreign_key: true

      t.timestamps
    end
  end
end
