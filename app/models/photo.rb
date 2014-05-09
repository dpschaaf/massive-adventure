class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :image_file, PhotoUploader

  def store_dir
    'public/my/upload/directory'
  end

  def cache_dir
    '/tmp/massive-adventure-cache'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  # validates :latitude, presence=> true
  # validates :longitude, presence=> true
  # validates :url, presence => true
end