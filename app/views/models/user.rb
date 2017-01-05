class User < ApplicationRecord
  has_secure_password

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

end
