class CreateAbsenceScheduleBlocks < ActiveRecord::Migration
  def change
    create_table :absence_schedule_blocks do |t|
      t.integer :absence_id, :null => :false, :default => 0
      t.integer :schedule_block_id, :null => false, :default => 0

      t.timestamps
    end
  end
end
