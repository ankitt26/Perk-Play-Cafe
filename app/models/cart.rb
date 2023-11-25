class Cart < ApplicationRecord
    belongs_to :user
   
    has_many :cart_foods 
    has_many :foods, through: :cart_foods

    validates :user_id, presence: true, numericality: { only_integer: true }  
end
