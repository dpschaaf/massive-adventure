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

get '/albums/all' do
  @albums = Album.all

  transfer_data = @albums.map do |album|
    album_data = {title: album.title,
                   description:  album.description,
                   city:  album.city,
                   country:  album.country,
                   arrival_date:  album.arrival_date,
                   departure_date:  album.departure_date,
                   latitude:  album.latitude,
                   longitude:  album.longitude}

    [album.id , [album_data, album.photos.sample.url]]
  end

  content_type :json
  Hash[transfer_data].to_json
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
  @photos_data = Hash[@photos.map { |pic| [pic.id, {latitude: pic.latitude,
                                                    longitude: pic.longitude,
                                                    url: pic.url,
                                                    title: pic.title,
                                                    description: pic.description
                                                    }
                                          ]
                                  }
                     ].to_json
   p @photos_data

  content_type :json
  {album: @album_data, photos: @photos_data}.to_json

end