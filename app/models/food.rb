class Food < ApplicationRecord
    has_many :cart_foods
    has_many :carts, through: :cart_foods
    
    has_many :order_foods
    has_many :orders, through: :order_foods  

    validates :name, presence: true, length: { maximum: 255 } 
    validates :price, numericality: { only_integer: true, less_than_or_equal_to: 10000 } 
    validates :cooking_time, :quantity, numericality: { only_integer: true, less_than_or_equal_to: 60 } 
end
