require 'spec_helper'

# arrange
# act
# assert

describe '/' do

  it "return an html file when '/' route is hit" do
    # No arrange

    get '/'

    expect(last_response["Content-Type"]).to eq("text/html;charset=utf-8")
  end
end

describe '/photos' do

  it "return an html file when '/' route is hit" do
    Photo.destroy_all
    10.times { Photo.create }

    get '/photos'

    expect(last_response["Content-Type"]).to eq("text/html;charset=utf-8")
  end

  it "have a photo url in the html file" do
    Photo.destroy_all
    test_url = "happy_fun_time"
    Photo.create(url: test_url)

    get '/photos'

    expect(last_response.body).to include(test_url)
  end


end

describe '/albums/:id' do
  it "should return a JSON object with an album key equal to album data" do
    #arrange
    Album.destroy_all
    pinkfuzzydice = Album.create(title: "pinkfuzzydice")
    album_data =  {title: pinkfuzzydice.title,
                 description:  pinkfuzzydice.description,
                 city:  pinkfuzzydice.city,
                 country:  pinkfuzzydice.country,
                 arrival_date:  pinkfuzzydice.arrival_date,
                 departure_date:  pinkfuzzydice.departure_date,
                 latitude:  pinkfuzzydice.latitude,
                 longitude:  pinkfuzzydice.longitude}.to_json

    #act
    get "albums/#{pinkfuzzydice.id}"

    #assert
    expect(JSON.parse(last_response.body)["album"]).to eq(album_data)
  end

  it "should return a JSON object with a photo key equal to photo data" do
    #arrange
    Album.destroy_all
    Photo.destroy_all
    pinkfuzzydice = Album.create(title: "pinkfuzzydice")
    my67cadillac = Photo.create(title: "my67cadillac")
    photos = pinkfuzzydice.photos << my67cadillac
    photos_data = Hash[photos.map { |pic| [pic.id, {latitude: pic.latitude,
                                                      longitude: pic.longitude,
                                                      url: pic.url,
                                                      title: pic.title,
                                                      description: pic.description
                                                      }
                                            ]
                                    }
                       ].to_json

    #act
    get "albums/#{pinkfuzzydice.id}"

    #assert
    expect(JSON.parse(last_response.body)["photos"]).to include(photos_data)

  end
end
