class Createeventuser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :events, :users do |t|
      t.index [:events_id, :users_id]
    end
  end
end
