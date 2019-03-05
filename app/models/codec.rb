class Codec < ApplicationRecord
    has_many :video_formats
    has_many :protocols, through: :video_formats, dependent: :destroy

    def name
        self.codec
    end
end
