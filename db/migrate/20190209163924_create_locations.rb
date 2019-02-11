class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :location
      t.string :address
      t.string :map

      t.timestamps
    end

    create_table :location_buildings do |t|
      t.string :building
      t.integer :local_x
      t.integer :local_y
      t.references :location, foreign_key: true

      t.timestamps
    end

    create_table :location_building_floors do |t|
      t.string :layout
      t.integer :floor
      t.references :location_building, foreign_key: true

      t.timestamps
    end

    create_table :location_areas do |t|
      t.string :area
      t.string :layout
      t.integer :floor_x
      t.integer :floor_y
      t.references :location_building_floor, foreign_key: true

      t.timestamps
    end
  end
end
