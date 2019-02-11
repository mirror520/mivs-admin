class LocationBuilding < ApplicationRecord
    belongs_to :location

    has_many :location_building_floors
    
    alias_attribute :floors, :location_building_floors
end
