class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name, null: false
      t.string :phone, null: false, length: {maximum: 15}
      t.string :address, null: false
      t.string :url

      t.timestamps null: false
    end
  end
end
