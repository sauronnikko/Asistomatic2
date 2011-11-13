class AddUniqueIndexOnNameToPeriods < ActiveRecord::Migration
  def change
    add_index :periods, :name, :unique => true
  end
end
