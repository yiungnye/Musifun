class Review < ApplicationRecord
  belongs_to :booking
  # belongs_to :instrument, through: :booking
  # belongs_to :user, through: :booking

  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :comment, presence: true
end
