require 'rails_helper'

RSpec.describe CartFood, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe', username: 'john_doe', email: 'john@example.com', password: 'password')
    @cart = @user.cart
    @food = Food.create(name: 'Pizza', price: 10, cooking_time: 15, quantity: 5)
    @cart_food = CartFood.create(cart_id: @cart.id, food_id: @food.id)
  end

  context 'validations' do
    it 'cart_id should be present' do
      @cart_food.cart_id = nil
      expect(@cart_food).not_to be_valid
    end

    it 'food_id should be present' do
      @cart_food.food_id = nil
      expect(@cart_food).not_to be_valid
    end

    it 'cart_id should be integer' do
      @cart_food.cart_id = 'string'
      expect(@cart_food).not_to be_valid
    end

    it 'food_id should be integer' do
      @cart_food.food_id = 'string'
      expect(@cart_food).not_to be_valid
    end
  end
end
