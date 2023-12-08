require 'rails_helper'

RSpec.describe OrderFood, type: :model do
  before(:each) do
    User.destroy_all
    Address.destroy_all
    Order.destroy_all
    Food.destroy_all
    OrderFood.destroy_all

    @user = User.create(name: 'John Doe', username: 'john_doe', email: 'john@example.com', password: 'password')
    @address = Address.create(landmark: 'Landmark 1', street: 'Street 1', city: 'City 1', pincode: 123_345,
                              state: 'State 1', country: 'Country 1', phone: 1_234_567_890, user_id: @user.id)
    @order = Order.create(user_id: @user.id, address_id: @address.id)
    @food = Food.create(name: 'Pizza', price: 10, cooking_time: 15, quantity: 5)
    @order_food = OrderFood.create(order_id: @order.id, food_id: @food.id)
  end

  context 'validations' do
    it 'order_id should be present' do
      @order_food.order_id = nil
      expect(@order_food).not_to be_valid
    end

    it 'food_id should be present' do
      @order_food.food_id = nil
      expect(@order_food).not_to be_valid
    end

    it 'order_id should be integer' do
      @order_food.order_id = 'string'
      expect(@order_food).not_to be_valid
    end

    it 'food_id should be integer' do
      @order_food.food_id = 'string'
      expect(@order_food).not_to be_valid
    end
  end
end
