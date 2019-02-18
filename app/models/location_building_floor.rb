class LocationBuildingFloor < ApplicationRecord
    belongs_to :location_building

    has_many :location_areas

    alias_attribute :areas, :location_areas
    alias_attribute :building, :location_building
end
