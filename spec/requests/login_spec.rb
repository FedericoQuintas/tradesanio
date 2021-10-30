require 'rails_helper'
require 'securerandom'
RSpec.describe "Login", type: :request do
    let(:user_email) {
        @user_email = 'email@com.ar'
      } 
      let(:pass){
        @pass = 'pa55w0rd'
      } 
      let(:user){
        @user = User.new(:email => user_email, :password => pass)
      } 
      let(:generatedToken){
        @generatedToken = SecureRandom.hex
      } 
    it 'authenticates a user' do
        @token = Token.new(:user => user)
        @token.token = generatedToken
        allow(User).to receive(:authenticate).with(user_email, pass).and_return(user)
        allow(Token).to receive(:create!).with(user).and_return(@token)
        post "/login", :params => { :email => user_email, :password => pass}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json")
        expect(response.headers['token']).to eq(generatedToken)
    end  
    
    it 'fails when credentials are incorrect' do

        post "/login", :params => { :email => user_email, :password => pass}

        expect(response).to have_http_status(:forbidden)
        expect(response.content_type).to eq("application/json; charset=utf-8")
    end  
end
