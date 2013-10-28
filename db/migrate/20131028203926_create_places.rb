class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
      t.decimal :lat
      t.decimal :lon

      t.timestamps
    end
  end
end
