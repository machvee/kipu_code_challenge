class CreateMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_orders do |t|
      t.string :name
      t.integer :unit
      t.decimal :dosage
      t.integer :route
      t.text :necessity
      t.belongs_to :patient, foreign_key: true

      t.timestamps
    end
  end
end
