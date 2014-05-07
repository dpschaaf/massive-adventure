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

get '/album/:id' do
  @album = Album.find(params[:id])

  @album_json = {title: @album.title,
                 description:  @album.description,
                 city:  @album.city,
                 country:  @album.country,
                 arrival_date:  @album.arrival_date,
                 departure_date:  @album.departure_date,
                 latitude:  @album.latitude,
                 longitude:  @album.longitude}.to_json

  @photos = @album.photos
  @photos_json = @photos.each_with_index.map { |pic, index| [index, {latitude: pic.latitude,
                                                                    longitude: pic.longitude,
                                                                    url: pic.url,
                                                                    title: pic.title,
                                                                    description: pic.description
                                                                    }.to_json]
                                              }


end