class CreateVideoFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :codecs do |t|
      t.string :codec

      t.timestamps
    end

    create_table :protocols do |t|
      t.string :protocol

      t.timestamps
    end

    create_table :video_formats do |t|
      t.string :format
      t.references :codec, foreign_key: true
      t.references :protocol, foreign_key: true

      t.timestamps
    end
  end
end
