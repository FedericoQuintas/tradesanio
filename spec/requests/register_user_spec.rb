require 'rails_helper'

RSpec.describe "RegisterUsers", type: :request do
  it 'registers a user' do
    post "/users", :params => { :email => "rolo@namibia.com"} 
    expect(response).to have_http_status(:created)
  end  
end
