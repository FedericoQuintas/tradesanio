require 'rails_helper'

RSpec.describe Security, :type => :model do

    it do
        should have_and_belong_to_many(:watchlists)
      end

    it 'is valid when has ticker' do
        expect(Security.create(:ticker => 'ticker')).to be_valid
    end

    it 'raises error if ticker is missing' do
        expect(Security.create()).to_not be_valid
    end
end