class Location < ApplicationRecord
    has_many :location_buildings

    alias_attribute :buildings, :location_buildings
end
