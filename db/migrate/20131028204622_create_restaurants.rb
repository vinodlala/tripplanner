class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :place_id
      t.string :cuisine
      t.integer :price

      t.timestamps
    end
  end
end
