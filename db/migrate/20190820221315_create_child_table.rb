class CreateChildTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:children) do |t|
      t.string :name
      t.boolean :alive
    end
  end
end