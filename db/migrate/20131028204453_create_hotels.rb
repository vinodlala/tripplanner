class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.integer :place_id
      t.integer :num_stars
      t.string :amenities

      t.timestamps
    end
  end
end
