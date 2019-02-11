class LocationArea < ApplicationRecord
    belongs_to :location_building_floor

    has_many :cameras
end
