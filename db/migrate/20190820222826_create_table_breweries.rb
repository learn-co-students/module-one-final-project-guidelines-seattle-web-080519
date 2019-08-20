class CreateTableBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.text :location
      t.string :url
    end
  end
end
