# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
# require 'exifr'
require 'uri'
require 'carrierwave'
require 'fog'
require 'mini_magick'



# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do
  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }


# Set up the database and models
require APP_ROOT.join('config', 'database')

LOCATIONS = {
   "SFO"=>[37.621313, -122.37895],
   "Singapore"=>[1.3185848, 103.8455665],
   "Phuket"=>[7.9034596, 98.29248],
   "Pulau Tioman"=>[2.8064825, 104.170334],
   "Sri Lanka"=>[7.293038, 80.6385],
   "Bangalore"=>[12.9308681, 77.6280534],
   "Hong Kong"=>[22.281032, 114.151355],
   "Kochi"=>[9.9639005, 76.2545944],
   "Alleppey"=>[9.4828804, 76.3762234],
   "Hampi"=>[15.3331898, 76.4633347],
   "Coonor"=>[11.350517, 76.810497],
   "Phnom Penh"=>[11.5724717, 104.9289601],
   "Siem Reap"=>[13.3416274, 103.8629545],
   "Koh Rong"=>[10.7603832, 103.2583631],
   "Jaipur"=>[26.9379439, 75.8592224],
   "Agra"=>[27.175015, 78.042155],
   "Taj Mahal"=>[27.175015, 78.042155],
   "Delhi"=>[28.6030523, 77.2423442],
   "Istanbul"=>[41.012732, 28.978713],
   "Khajuraho"=>[24.8522879, 79.9213288],
   "Andaman Islands"=>[12.0347219, 92.9990131],
   "Bangkok"=>[13.7592371, 100.4972945],
   "Sukhothai"=>[17.014511, 99.822936],
   "Chiang Mai"=>[18.7919774, 98.9913353],
   "Yangon"=>[16.7991704, 96.14624],
   "Bagan"=>[21.185197, 94.886556],
   "Inle Lake"=>[20.6583147, 96.9313623],
   "Tachileik"=>[20.4484457, 99.8872393],
   "Chiang Rai"=>[19.9029292, 99.8365673],
   "Chiang Khong"=>[20.2743301, 100.4048031],
   "Huay Xai"=>[20.2731582, 100.4148764],
   "Luang Prabang"=>[19.8947774, 102.1415019],
   "Hanoi"=>[21.0360092, 105.8503477],
   "Ha Long Bay"=>[20.9461867, 107.0031452],
   "Hoi An"=>[15.888631, 108.3450479]
}

def seed_photo_album(site, album, photos, remote_directory, dates=[] )

  photos.each do |pic|

    photo_info = {
    latitude: LOCATIONS[site][0]+((0..9).to_a.sample*0.002*(-1)**(0..9).to_a.sample),
    longitude: LOCATIONS[site][1]+((0..9).to_a.sample*0.002*(-1)**(0..9).to_a.sample),
    url: "#{remote_directory}/#{pic}",
    title: site
    }

    # dates << image_data.date_time

    album.photos.create(photo_info)
  end

  # dates.compact!
  # new_album.arrival_date = dates.min
  # new_album.departure_date = dates.max
  # new_album.save!

end

# image_data = EXIFR::JPEG.new("#{remote_directory}/#{pic}")
# if image_data.exif?
#   photo_info[:height] = image_data.height #EXIF
#   photo_info[:width] = image_data.width #EXIF
#   photo_info[:aspect_ratio] = image_data.width/image_data.height.to_f #EXIF
#   photo_info[:make] = image_data.make #EXIF
#   photo_info[:model] = image_data.model #EXIF
#   photo_info[:date_time] = image_data.date_time #EXIF
# end