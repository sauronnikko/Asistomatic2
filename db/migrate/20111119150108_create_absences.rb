class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.string :description
      t.integer :employee_id, :null => false, :default => 0
      t.integer :date_id, :null => false, :default => 0

      t.timestamps
    end
  end
end
