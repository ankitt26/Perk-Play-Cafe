class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  after_create :create_initial_cart
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy

  validates :name, :username, :email, :password, presence: true

  private

  def create_initial_cart
    Cart.create(user_id: self.id)
  end
  
end
