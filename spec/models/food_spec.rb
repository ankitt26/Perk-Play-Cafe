require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @food = Food.create(name: 'Pizza', price: 10, cooking_time: 15, quantity: 5)
  end

  context 'Validate all field must be present' do
    it "name shouldn't be empty" do
      @food.name = ''
      expect(@food).not_to be_valid
    end

    it "price shouldn't be empty" do
      @food.price = ''
      expect(@food).not_to be_valid
    end

    it "cooking_time shouldn't be empty" do
      @food.cooking_time = ''
      expect(@food).not_to be_valid
    end

    it "quantity shouldn't be empty" do
      @food.quantity = ''
      expect(@food).not_to be_valid
    end
  end

  context 'Price validation' do
    it 'price should only be integer' do
      @food.price = 'abcd'
      expect(@food).not_to be_valid
    end

    it 'price should be less than or equal to 10000' do
      @food.price = 11_000
      expect(@food).not_to be_valid
    end
  end

  context 'Cooking time validation' do
    it 'cooking time should only be integer' do
      @food.cooking_time = 'abcde'
      expect(@food).not_to be_valid
    end

    it 'cooking time should be less than or equal to 60' do
      @food.cooking_time = '70'
      expect(@food).not_to be_valid
    end
  end

  context 'quantity validation' do
    it 'quantity should only be integer' do
      @food.quantity = 'abcde'
      expect(@food).not_to be_valid
    end

    it 'quantity should be less than or equal to 1000' do
      @food.quantity = '1001'
      expect(@food).not_to be_valid
    end
  end
end
