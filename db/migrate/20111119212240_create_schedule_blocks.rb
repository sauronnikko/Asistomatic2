class CreateScheduleBlocks < ActiveRecord::Migration
  def change
    create_table :schedule_blocks do |t|
      t.time :start_time, :null => false, :default => Time.now
      t.time :end_time, :null => false, :default => Time.now + 1.hour
      t.integer :schedule_id, :default => false, :default => 0

      t.timestamps
    end
  end
end
