require 'rails_helper'

RSpec.describe User, :type => :model do

    it 'is valid when has the pass and email' do
        @user = User.new(:email => 'email@com.ar', :password => 'password')
        expect(@user.save!).to be(true) 
    end

    it 'raises error if pass is missing' do
        @user = User.new(:email => 'email@com.ar')
        expect(@user.save).to be(false) 
    end

    it 'raises error if email is missing' do
        @user = User.new(:password => 'password')
        expect(@user.save).to be(false) 
    end
    
end