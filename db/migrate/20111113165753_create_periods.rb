class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :name, :null => false, :default => ""
      t.string :code

      t.timestamps
    end
  end
end
