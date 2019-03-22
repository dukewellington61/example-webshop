class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :products
  has_many :comments, dependent: :nullify
  has_many :carts
  validates :first_name, presence: true
  validates :last_name, presence: true

end
