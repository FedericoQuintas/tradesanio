require 'rails_helper'

RSpec.describe "AddSecurities", type: :request do
  
  it 'adds a Security' do
    @ticker = "PLTR"

    post "/securities", :params => { :ticker => @ticker} 
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end  

  it 'fails when ticker is nil' do
    post "/securities", :params => {:ticker => @ticker} 
    expect(response).to have_http_status(:bad_request)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end  
end
