require 'rails_helper'

RSpec.describe "RegisterUsers", type: :request do
  let(:user_email) {
    @user_email = 'email@com.ar'
  } 
  let(:pass){
    @pass = 'pa55w0rd'
  } 
  it 'registers a user' do
    post "/users", :params => { :email => user_email, :pass => pass}

    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body)['email']).to eq(user_email)
  end  

  it 'fails when email is nil' do
    post "/users", :params => {:pass => pass} 
    expect(response).to have_http_status(:bad_request)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end  

  it 'fails when email is repeated' do
    @user = User.new(:email => 'email@com.ar', :password => 'password')
    @user.save!
    post "/users", :params => { :email => user_email, :pass => pass}
    expect(response).to have_http_status(:bad_request)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body)['error']).to eq("Email already taken")
  end  
  it 'fails when pass is nil' do
    post "/users", :params => {:email => user_email} 
    expect(response).to have_http_status(:bad_request)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end  
  it 'fails when pass is too short' do
    post "/users", :params => { :email => user_email, :pass => 'pass'}
    expect(response).to have_http_status(:bad_request)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end  
end
