class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :sex
      t.string :born
      t.string :mother_name
      t.string :father_name
      t.string :entry_date
      t.string :exit_date
      t.text :infos

      t.timestamps
    end
  end
end
