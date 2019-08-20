class CreateUserTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|
      t.string :name
      t.integer :phase
      t.integer :wellness_score
      t.integer :resources
    end
  end
end