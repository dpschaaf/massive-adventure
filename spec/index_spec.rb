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
    10.times { Photo.create() }

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

describe '/'