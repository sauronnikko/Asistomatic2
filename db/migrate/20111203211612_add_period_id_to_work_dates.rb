class AddPeriodIdToWorkDates < ActiveRecord::Migration
  def change
    add_column :work_dates, :period_id, :integer, :null => false, :default => 0
  end
end
