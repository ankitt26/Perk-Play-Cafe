class Food < ApplicationRecord
  has_many :cart_foods
  has_many :carts, through: :cart_foods

  has_many :order_foods
  has_many :orders, through: :order_foods

  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10_000 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 60 }
  validates :quantity, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 1000 }
end
