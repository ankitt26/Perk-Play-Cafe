require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'John Doe', username: 'john_doe', email: 'john@example.com', password: 'password')
  end

  context 'Validate all field must be present' do
    it 'when name is empty' do
      @user.name = ''
      expect(@user).not_to be_valid
    end

    it 'when username is empty' do
      @user.username = ''
      expect(@user).not_to be_valid
    end

    it 'when email is empty' do
      @user.email = ''
      expect(@user).not_to be_valid
    end

    it 'when pass is empty' do
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
