class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :bookings
  has_many :instruments, through: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :address, :first_name, :last_name, presence: true
end
