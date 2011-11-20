class AddStartDateAndEndDateToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :start_date, :date, :null => false, :default => Date.today
    add_column :periods, :end_date, :date, :null => false, :default => Date.today + 3.months
  end
end
