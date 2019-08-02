class Place < ApplicationRecord

  belongs_to :user

  validates :postcode, presence: true

end
