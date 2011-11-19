class AddUniquenessIndexOnAbsenceIdToJustification < ActiveRecord::Migration
  def change
    add_index :justifications, :absence_id, :unique => true
  end
end
