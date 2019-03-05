class Protocol < ApplicationRecord
    has_many :video_formats
    has_many :codecs, through: :video_formats, dependent: :destroy

    def name
        self.protocol
    end
end
