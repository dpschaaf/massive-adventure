class Photo < ActiveRecord::Base
  # include CarrierWave::MiniMagick

  belongs_to :album


  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

# CarrierWave.configure do |config|
#   config.ftp_host = ENV['FTP_HOST']
#   config.ftp_port = 21
#   config.ftp_user = ENV['FTP_USERNAME']
#   config.ftp_passwd = ENV['FTP_PASSWORD']
#   config.ftp_folder = ENV['FTP_FOLDER']
#   config.ftp_url = ENV['FTP_URL']
# end

# class PhotoUploader < CarrierWave::Uploader::Base
#   storage :ftp

# end
# Photo.connection.mount_uploader :image_file, PhotoUploader
# directory ='/Users/Dave/Pictures/Hong Kong - Visit 1/'
# file = File.open(directory +'DSCF3250.JPG')



# saver = PhotoUploader.new

# saver.store!(file)

end