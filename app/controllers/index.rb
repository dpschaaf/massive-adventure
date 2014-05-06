get '/' do
  @photo = Photo.find((1..10).to_a.sample)
  content_type :json
  {latitude: @photo.latitude, longitude: @photo.longitude}
  erb :map_canvas
end

