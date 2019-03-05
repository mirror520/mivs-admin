class Location < ApplicationRecord
    has_many :location_buildings

    alias_attribute :buildings, :location_buildings

    def name
        self.location
    end
end
