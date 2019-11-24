class CreateCameras < ActiveRecord::Migration[5.2]
  def change
    create_table :cameras do |t|
      t.string :name
      t.string :address
      t.integer :output_width
      t.integer :output_height
      t.integer :x
      t.integer :y
      t.boolean :is_record_enabled
      t.boolean :is_enabled
      t.references :camera_brand, foreign_key: true
      t.references :camera_video_format, foreign_key: true
      t.references :location_area, foreign_key: true

      t.timestamps
    end
  end
end
