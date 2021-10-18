require 'rails_helper'

RSpec.describe User, :type => :model do

    it 'is valid when has the pass and email' do
        expect(User.create(:email => 'email', :pass => 'pass')).to be_valid
    end

    it 'raises error if pass is missing' do
        expect(User.create(:email => 'email')).to_not be_valid
    end

    it 'raises error if email is missing' do
        expect(User.create(:pass => 'pass')).to_not be_valid
    end
end