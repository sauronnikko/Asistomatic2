class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name, :null => false, :default => ""
      t.string :code
      t.integer :period_id, :null => false, :default => 0

      t.timestamps
    end
  end
end
