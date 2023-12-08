require 'rails_helper'

RSpec.describe Address, type: :model do
  before(:each) do
    User.destroy_all
    Address.destroy_all
    @user = User.create(name: 'John Doe', username: 'john_doe', email: 'john@example.com', password: 'password')
    @address = Address.create(landmark: 'Landmark 1', street: 'Street 1', city: 'City 1', pincode: 123_456,
                              state: 'State 1', country: 'Country 1', phone: 1_234_567_890, user_id: @user.id)
  end

  context 'validate all fields must be present ' do
    it 'landmark should be present' do
      @address.landmark = ''
      expect(@address).not_to be_valid
    end

    it 'street should be present' do
      @address.street = ''
      expect(@address).not_to be_valid
    end

    it 'city should be present' do
      @address.city = ''
      expect(@address).not_to be_valid
    end

    it 'pincode should be present' do
      @address.pincode = ''
      expect(@address).not_to be_valid
    end

    it 'state should be present' do
      @address.state = ''
      expect(@address).not_to be_valid
    end

    it 'country should be present' do
      @address.country = ''
      expect(@address).not_to be_valid
    end

    it 'phone should be present' do
      @address.phone = ''
      expect(@address).not_to be_valid
    end
  end
end
