class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
  	[first_name, last_name].join(" ")
  end

  has_one :card, dependent: :destroy

  has_one :place, dependent: :destroy
  
end
