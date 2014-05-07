class Photo < ActiveRecord::Base
  belongs_to :album
  # validates :latitude, presence=> true
  # validates :longitude, presence=> true
  # validates :url, presence => true
end