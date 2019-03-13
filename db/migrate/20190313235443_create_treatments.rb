class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.text :description
      t.text :necessity
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end
