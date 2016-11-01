require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'authenticated?' do
    it 'authenticated? should return false for a user with nil digest' do
      @user = User.first
      expect(@user.authenticated?(:activation, '')).to be false
    end
  end

end
