class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.references :diagnosable, polymorphic: true, index: true
      t.string :coding_system
      t.string :code
      t.text :description
      t.timestamps
    end
  end
end
