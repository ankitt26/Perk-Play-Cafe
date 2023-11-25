class CartFood < ApplicationRecord
    belongs_to :cart
    belongs_to :food

    validates :cart_id, presence: true, numericality: { only_integer: true }
    validates :food_id, presence: true, numericality: { only_integer: true }
  
end
