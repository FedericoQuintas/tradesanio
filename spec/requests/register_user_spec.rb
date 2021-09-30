require 'rails_helper'


RSpec.describe "RegisterUsers", type: :request do

  it 'registers a user' do
    @user_email = "rolo@namibia.com"

    post "/users", :params => { :email => @user_email} 
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body)['email']).to eq(@user_email)
  end  
end
