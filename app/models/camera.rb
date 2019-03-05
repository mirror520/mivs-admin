class Camera < ApplicationRecord
    belongs_to :camera_brand
    belongs_to :camera_video_format
    belongs_to :location_area

    has_one :video_format, through: :camera_video_format, source: :video_format

    has_and_belongs_to_many :servers

    alias_attribute :format, :video_format
    alias_attribute :area, :location_area

    def name
        self.camera
    end
end
