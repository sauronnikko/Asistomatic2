class AddUniquenessIndexOnEverythingToScheduleBlocks < ActiveRecord::Migration
  def change
    add_index :schedule_blocks, [:schedule_id, :start_time], :unique => true
    add_index :schedule_blocks, [:schedule_id, :end_time], :unique => true
  end
end
