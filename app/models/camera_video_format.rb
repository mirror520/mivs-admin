class CameraVideoFormat < ApplicationRecord
    belongs_to :camera_brand
    belongs_to :video_format

    def name
        video_format.format
    end
end
