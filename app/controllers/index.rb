# require "dotenv"
# Dotenv.load

GOOGLE_MAPS_SOURCE = "https://maps.googleapis.com/maps/api/js?key=#{ENV['GOOGLE_MAPS_API']}&sensor=false"

get '/' do
  @photo = Photo.all.first
  erb :index
end

get '/photos' do
  @photo = Photo.find((1..10).to_a.sample)
  erb :map_canvas
end

get '/path' do
  erb :path
end

