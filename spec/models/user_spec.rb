require 'rails_helper'

RSpec.describe User, :type => :model do
    it 'raises error if pass is missing' do
        expect(User.create(:email => 'email').valid?).to be(false)
    end

    it 'raises error if email is missing' do
        expect(User.create(:pass => 'pass').valid?).to be(false)
    end
end