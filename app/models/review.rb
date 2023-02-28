class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :instrument, through: :booking
  belongs_to :user, through: :booking

  validates :rating, presence: true
end
