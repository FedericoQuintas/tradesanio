require 'rails_helper'

RSpec.describe "CreateWatchLists", type: :request do

  let(:description) {
      @description = "crypto"
  }  
  it 'post /watchlists' do

    post "/watchlists", :params => { :description => description} 
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body)['description']).to eq(description)
  end

  it 'fails when watchlist with same description exists' do

    allow(Watchlist).to receive(:where).and_return(Watchlist.new(description: description, user_id: 1))
    post "/watchlists", :params => { :description => description}  , :headers => {'X-User-ID' => 1}
    expect(response).to have_http_status(:bad_request)
    expect(JSON.parse(response.body)['error']).to eq("Description repeated")
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end 

  it 'fails when watchlist description is nil' do
    post "/watchlists", :params => { :description => nil} 
    expect(response).to have_http_status(:bad_request)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end 
end
