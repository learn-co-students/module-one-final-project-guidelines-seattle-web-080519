class UpdateEventTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :damage, :integer
    add_column :events, :low_chance_damage, :integer
    add_column :events, :high_chance_damage, :integer
  end
end