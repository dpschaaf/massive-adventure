# require "dotenv"
# Dotenv.load

GOOGLE_MAPS_SOURCE = "https://maps.googleapis.com/maps/api/js?key=#{ENV['GOOGLE_MAPS_API']}&sensor=false"

get '/' do
  @photo = Photo.all.first
  erb :index
end

get '/photos' do
  @photo = Photo.all.sample
  erb :map_canvas
end

get '/photos/:id' do
  @photo = Photo.find(params[:id])
  erb :map_canvas
end


get '/path' do
  erb :path
end

get '/photos/new' do
  erb :new_photo
end

post '/photos/new' do
  Photo.create(params)
  @id = Photo.all.last.id
  redirect '/photos/#{@id}'
end

