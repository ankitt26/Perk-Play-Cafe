class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  after_create :create_initial_cart
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
         
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy

  validates :name, :username, :email, presence: true

  private

  def create_initial_cart
    Cart.create(user_id: id)
  end
end
