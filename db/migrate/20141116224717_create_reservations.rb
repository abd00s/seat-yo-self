class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.date :date
      t.datetime :time
      t.integer :size

      t.timestamps
    end
  end
end
