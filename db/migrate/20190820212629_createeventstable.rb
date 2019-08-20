class Createeventstable < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :definition
      t.integer :cost
      t.integer :damage
    end
  end
end
