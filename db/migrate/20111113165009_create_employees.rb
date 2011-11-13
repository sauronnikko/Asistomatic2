class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, :null => false, :default => ""
      t.string :first_last_name, :null => false, :default => ""
      t.string :unique_id, :null => false, :default => ""
      t.string :employee_type
      t.date :date_of_birth

      t.timestamps
    end
  end
end
