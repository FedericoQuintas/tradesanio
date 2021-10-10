require 'rails_helper'

RSpec.describe "CreateWatchLists", type: :request do
  it 'post /watchlists' do
    @description = "crypto"

    post "/watchlists", :params => { :description => @description} 
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body)['description']).to eq(@description)
  end

  it 'fails when watchlist with same description exists' do

    @description = "crypto"

    post "/watchlists", :params => { :description => @description} 
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body)['description']).to eq(@description)
    post "/watchlists", :params => { :description => @description} 
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
