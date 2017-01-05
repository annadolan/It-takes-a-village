class User < ApplicationRecord
  has_secure_password

  has_many :events, through: :user_events
  has_many :roles, through: :user_events
  has_many :user_events
  has_many :tasks

  geocoded_by :full_street_address
  after_update :geocode

  validates_confirmation_of :password

  validates :first_name,
            :last_name,
            :email, presence: true

  validates :email, uniqueness: true

  def full_street_address
    "#{street_number}, #{city}, #{state}, #{zip_code}"
  end

end
