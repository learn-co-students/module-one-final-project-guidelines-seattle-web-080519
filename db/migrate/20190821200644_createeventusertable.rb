class Createeventusertable < ActiveRecord::Migration[5.0]
  def change
    create_table :eventusers do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
