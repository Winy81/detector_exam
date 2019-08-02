class Card < ApplicationRecord

  belongs_to :user

  validates :last_four_digits, presence: true
  validates :expiry_date, presence: true
  validates_length_of :last_four_digits, is: 4,  message: "Number must be 4 digit long"

end
