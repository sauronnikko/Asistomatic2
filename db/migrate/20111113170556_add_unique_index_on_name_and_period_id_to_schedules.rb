class AddUniqueIndexOnNameAndPeriodIdToSchedules < ActiveRecord::Migration
  def change
    add_index :schedules, [:period_id, :name], :unique => true

  end
end
