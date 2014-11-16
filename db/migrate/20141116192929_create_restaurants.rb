class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.text :description
      t.integer :open_time
      t.integer :close_time
      t.integer :capacity

      t.timestamps
    end
  end
end
