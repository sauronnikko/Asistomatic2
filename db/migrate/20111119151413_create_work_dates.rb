class CreateWorkDates < ActiveRecord::Migration
  def change
    create_table :work_dates do |t|
      t.date :work_date, :null => false, :default => Date.today

      t.timestamps
    end
  end
end
