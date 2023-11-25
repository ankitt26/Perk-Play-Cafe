class Food < ApplicationRecord
    has_many :cart_foods
    has_many :carts, through: :cart_foods
    
    has_many :order_foods
    has_many :orders, through: :order_foods  
end
