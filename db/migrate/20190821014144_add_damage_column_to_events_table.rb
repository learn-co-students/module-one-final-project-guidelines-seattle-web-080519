class AddDamageColumnToEventsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :damage, :integer
  end
end
