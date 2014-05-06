get '/' do
  @photo = Photo.find((1..10).to_a.sample)

  erb :map_canvas
end

