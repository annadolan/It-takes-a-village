class User < ApplicationRecord
  has_secure_password

  geocoded_by :full_street_address
  after_validation :geocode

  # belongs_to :category

  validates_confirmation_of :password

  validates :first_name,
            :last_name,
            :street_number,
            :city,
            :state,
            :zip_code,
            :email,
            :picture,
            :phone, presence: true

  validates :email, uniqueness: true

  def full_street_address
    "#{street_number}, #{city}, #{state}, #{zip_code}"
  end

end
