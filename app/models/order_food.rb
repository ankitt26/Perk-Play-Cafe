class OrderFood < ApplicationRecord
    belongs_to :order
    belongs_to :food

    validates :order_id, presence: true, numericality: { only_integer: true }
    validates :food_id, presence: true, numericality: { only_integer: true }
  
end
