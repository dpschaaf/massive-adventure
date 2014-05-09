# require 'rubygems'
# require 'carrierwave'
# require 'carrierwave/storage/ftp'
# require 'fog'
# require 'mini_magick'
# require 'uri'
# require 'dotenv'
# Dotenv.load

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

# # directory ='/Users/Dave/Pictures/Hong Kong - Visit 1/'
# # file = File.open(directory +'DSCF3250.JPG')



# # saver = PhotoUploader.new

# # saver.store!(file)


