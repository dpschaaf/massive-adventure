# require "dotenv"
# Dotenv.load

GOOGLE_MAPS_SOURCE = "https://maps.googleapis.com/maps/api/js?key=#{ENV['GOOGLE_MAPS_API']}&sensor=false"

get '/' do
  erb :index
end

get '/photos' do
  @photo = Photo.all.sample
  erb :photo
end

get '/photos/:id' do
  @photo = Photo.find(params[:id])
  erb :photo
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


get '/albums' do

  erb :album
end

get '/albums/:id' do
  @album = Album.find(params[:id])

  @album_data = {title: @album.title,
                 description:  @album.description,
                 city:  @album.city,
                 country:  @album.country,
                 arrival_date:  @album.arrival_date,
                 departure_date:  @album.departure_date,
                 latitude:  @album.latitude,
                 longitude:  @album.longitude}.to_json

  @photos = @album.photos
  @photos_data = @photos.each_with_index.map { |pic, index| [index, {latitude: pic.latitude,
                                                                    longitude: pic.longitude,
                                                                    url: pic.url,
                                                                    title: pic.title,
                                                                    description: pic.description
                                                                    }]}

  content_type :json
  {album: @album_data, photos: @photos_data}.to_json
end