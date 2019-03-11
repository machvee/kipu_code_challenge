class AddGenderToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :gender, :integer
  end
end
