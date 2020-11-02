class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name 
      t.integer :practice_time 
      t.integer :user_id
    end
  end
end
