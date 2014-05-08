require 'spec_helper'

# arrange
# act
# assert

describe '/' do

  it "return erb :index when '/' route is hit" do
    # No arrange

    get '/'

    expect(last_response["Content-Type"]).to eq("text/html;charset=utf-8")
  end

  it '/photos' do

end