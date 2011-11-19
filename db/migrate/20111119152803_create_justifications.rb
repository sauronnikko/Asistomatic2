class CreateJustifications < ActiveRecord::Migration
  def change
    create_table :justifications do |t|
      t.string :description, :null => false, :default => ""
      t.boolean :is_justified, :null => false, :default => 0
      t.integer :absence_id, :null => false, :default => 0

      t.timestamps
    end
  end
end
