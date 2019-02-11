class CameraBrand < ApplicationRecord
    belongs_to :camera_type
    
    has_many :camera_video_formats
    has_many :video_formats, through: :camera_video_formats
    
    has_many :cameras
    
    alias_attribute :type, :camera_type
    alias_attribute :formats, :video_formats
end
