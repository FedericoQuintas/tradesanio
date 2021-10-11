require 'rails_helper'
RSpec.describe "RegisterUsers", type: :request do

  it 'registers a user' do
    @user_email = "rolo@namibia.com"
    @pass = "pa55w0rd"

    post "/users", :params => { :email => @user_email, :pass => @pass} , :headers => {'X-User-ID' => 1}
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body)['email']).to eq(@user_email)
  end  

  it 'fails when email is nil' do
    post "/users", :params => {:pass => @pass} 
    expect(response).to have_http_status(:bad_request)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end  
  it 'fails when pass is nil' do
    post "/users", :params => {:email => @user_email} 
    expect(response).to have_http_status(:bad_request)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end  
end
