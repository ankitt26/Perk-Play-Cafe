class Order < ApplicationRecord
    belongs_to :user

    has_many :order_foods
    has_many :foods, through: :order_foods 

    validates :user_id, presence: true, numericality: { only_integer: true }
    validates :address_id, presence: true, numericality: { only_integer: true }
    validates :delivered, inclusion: { in: [true, false] }
  
end
