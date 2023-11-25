class Address < ApplicationRecord
  belongs_to :user

  validates :landmark, :street, :city, :pincode, :state, :country, :phone, presence: true
  validates :pincode, numericality: { only_integer: true }
  validates :phone, numericality: { only_integer: true }
  validates :phone, length: { is: 10 }
  validates :pincode, length: { is: 6 }
  validates :user_id, presence: true, numericality: { only_integer: true }
end
