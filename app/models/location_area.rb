class LocationArea < ApplicationRecord
    belongs_to :location_building_floor

    has_many :cameras

    alias_attribute :building_floor, :location_building_floor
end
