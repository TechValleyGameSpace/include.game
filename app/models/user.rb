# Users should never be destroyed
class User < ActiveRecord::Base
  # Indicate password is required here
  has_secure_password
  
  # Define status enum
  enum status: [ :normal, :admin, :banned ]

  # Indicate all the associations this model has to other models
  has_many :user_role_in_events
  has_many :user_role_in_submissions
  has_many :user_role_in_teams
  has_many :events, through: :user_role_in_events
  has_many :submissions, through: :user_role_in_submissions
  has_many :teams, through: :user_role_in_teams

  # These are the requirements in the user
  validates :username, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :password, length: { minimum: 8 }, allow_nil: true
  
  # Handle geo-coding
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def to_param 
    username
  end
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
