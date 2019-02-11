class CreateCameraBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :camera_types do |t|
      t.string :name

      t.timestamps
    end

    create_table :camera_brands do |t|
      t.string :brand
      t.string :model
      t.boolean :is_ptz_available
      t.boolean :is_sound_available
      t.boolean :is_infrared_available
      t.boolean :is_flash_available
      t.integer :max_resolution_width
      t.integer :max_resolution_height
      t.references :camera_type, foreign_key: true

      t.timestamps
    end

    create_table :camera_video_formats do |t|
      t.references :camera_brand, foreign_key: true
      t.references :video_format, foreign_key: true

      t.timestamps
    end
  end
end
