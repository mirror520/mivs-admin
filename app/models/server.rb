class Server < ApplicationRecord
    belongs_to :location_area, optional: true
    belongs_to :serviceable, polymorphic: true

    has_one :self_ref, class_name: "Server", foreign_key: :id
    has_one :dvr, through: :self_ref, source: :serviceable, source_type: "Dvr"

    has_and_belongs_to_many :cameras
end
