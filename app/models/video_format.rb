class VideoFormat < ApplicationRecord
    before_create :add_format_name

    belongs_to :protocol
    belongs_to :codec

    has_many :camera_video_formats
    has_many :camera_brands, through: :camera_video_formats

    private
    def add_format_name
        self.format = codec.codec
        self.format << "_OVER_" 
        self.format << protocol.protocol
    end
end
