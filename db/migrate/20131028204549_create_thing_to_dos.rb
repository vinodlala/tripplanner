class CreateThingToDos < ActiveRecord::Migration
  def change
    create_table :thing_to_dos do |t|
      t.integer :place_id
      t.string :age_range

      t.timestamps
    end
  end
end
