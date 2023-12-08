require 'rails_helper'

RSpec.describe Cart, type: :model do
  before(:each) do
    User.destroy_all
    Cart.destroy_all

    @user = User.create(name: 'John Doe', username: 'john_doe', email: 'john@example.com', password: 'password')
  end

  context 'validations' do
    it 'is not valid without a user_id' do
      @user.cart.user_id = nil
      expect(@user.cart).not_to be_valid
    end

    it 'validates user_id presence' do
      @user.cart.user_id = ''
      expect(@user.cart).not_to be_valid
    end
  end
end
