class User < ApplicationRecord
  has_secure_password

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", :url =>':s3_domain_url', :path => '/:class/:attachment/:id_partition/:style/:filename' }, default_url: "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes

  has_many :user_events
  has_many :events, through: :user_events
  has_many :roles, through: :user_events

  has_many :users_tasks
  has_many :tasks, through: :users_tasks

  after_validation :generate_slug

  geocoded_by :full_street_address
  after_validation :geocode

  validates_confirmation_of :password

  validates :first_name,
            :last_name,
            :email, presence: true

  validates :email, uniqueness: true

  def full_street_address
    "#{street_number}, #{city}, #{state}, #{zip_code}"
  end

  def generate_slug
    random_string = SecureRandom.hex
    self.slug = [first_name.parameterize, last_name.parameterize, random_string].join("-")
  end

  def has_events?
    !user_events.empty?
  end

end
