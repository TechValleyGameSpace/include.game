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
  
  def to_param 
    username
  end
end
