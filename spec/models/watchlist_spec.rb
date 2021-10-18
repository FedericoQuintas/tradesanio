require 'rails_helper'

RSpec.describe Watchlist, :type => :model do
    let(:user) {
        @user = User.create(:pass => "pass", :email => "email")
    }  
    it do
        should have_and_belong_to_many(:securities)
      end

    it { should belong_to(:user) }

    it 'is valid when has description and userId' do
        expect(Watchlist.create(:description => 'description', :user =>user)).to be_valid
    end

    it 'raises error if description is missing' do
        expect(Watchlist.create(:user =>user)).to_not be_valid
    end

    it 'raises error if user is missing' do
        expect(Watchlist.create(:description =>"desc")).to_not be_valid
    end
end