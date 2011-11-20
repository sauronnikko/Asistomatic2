class AddUniquenessIndexOnDatesToPeriods < ActiveRecord::Migration
  def change
    add_index :periods, :start_date, :unique => true
    add_index :periods, :end_date, :unique => true
  end
end
