require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'John Doe', username: 'john_doe', email: 'john@example.com', password: 'password')
  end

  context 'Validate all field must be present' do
    it 'name should be present' do
      @user.name = ''
      expect(@user).not_to be_valid
    end

    it 'username should be present' do
      @user.username = ''
      expect(@user).not_to be_valid
    end

    it 'email should be present' do
      @user.email = ''
      expect(@user).not_to be_valid
    end

    it 'pass should be present' do
      @user.password = ''
      expect(@user).not_to be_valid
    end
  end

  context 'create initial cart' do
    it 'cart should be created' do
      expect(@user.cart).to be_present
    end
  end
end
