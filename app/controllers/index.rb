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

