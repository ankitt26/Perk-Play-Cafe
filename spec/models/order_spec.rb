require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do
    User.destroy_all
    Order.destroy_all
    Address.destroy_all

    @user = User.create(name: 'John Doe', username: 'john_doe', email: 'john@example.com', password: 'password')
    @addresse = Address.create(landmark: 'Landmark 1', street: 'Street 1', city: 'City 1', pincode: 123_345,
                               state: 'State 1', country: 'Country 1', phone: 1_234_567_890, user_id: @user.id)
    @order = Order.create(user_id: @user.id, address_id: @addresse.id, delivered: false)
  end

  context 'validations' do
    it 'user_id should be present' do
      @order.user_id = ''
      expect(@order).not_to be_valid
    end

    it 'user_id should be integer' do
      @order.user_id = 'abcd'
      expect(@order).not_to be_valid
    end

    it 'address_id should be present' do
      @order.address_id = nil
      expect(@order).not_to be_valid
    end

    it 'address_id should be integer' do
      @order.address_id = 'abc'
      expect(@order).not_to be_valid
    end

    it 'delivered value should be boolean' do
      @order.delivered = true
      expect(@order).to be_valid
    end

    it 'delivered value should be boolean' do
      @order.delivered = false
      expect(@order).to be_valid
    end
  end
end
