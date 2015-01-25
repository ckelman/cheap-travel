class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.decimal :price
      t.string :departure_city
      t.string :arrival_city
      t.datetime :departure_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
