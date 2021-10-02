require 'rails_helper'

RSpec.describe "FindUsers", type: :request do
  describe "GET /users" do
    it 'finds a user by email' do
      @user_email = "rolo@namibia.com"
      post "/users", :params => { :email => @user_email} 
      get "/users", :params => { :email => @user_email} 
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(JSON.parse(response.body)['email']).to eq(@user_email)
    end
    
    it 'fails when email is nil' do
      get "/users", :params => { :email => @user_email} 
      expect(response).to have_http_status(:bad_request)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end  
  end
end
