class AddUniqueIndexOnUniqueIdToEmployees < ActiveRecord::Migration
  def change
    add_index :employees, :unique_id, :unique => true 
  end
end
