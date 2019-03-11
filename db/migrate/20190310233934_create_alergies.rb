class CreateAlergies < ActiveRecord::Migration[5.2]
  def change
    create_table :alergies do |t|
      t.text :description
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end
