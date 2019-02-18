class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :address
      t.integer :port
      t.references :location_area, foreign_key: true
      t.references :serviceable, polymorphic: true

      t.timestamps
    end

    create_table :cameras_servers, primary_key: %i[camera_id server_id] do |t|
      t.references :camera, foreign_key: true
      t.references :server, foreign_key: true
    end

    create_table :dvrs do |t|
      t.string :account
      t.string :password
      t.integer :channel_num

      t.timestamps
    end
  end
end
