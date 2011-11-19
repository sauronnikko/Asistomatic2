class AddUniquenessIndexOnWorkDateToWorkDates < ActiveRecord::Migration
  def change
    add_index :work_dates, :work_date, :unique => true

  end
end
