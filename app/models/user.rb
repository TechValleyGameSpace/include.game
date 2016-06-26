# Users should never be destroyed
class User < ActiveRecord::Base
  # Define status enum
  enum status: [ :normal, :admin, :banned ]
  
  before_save :default_values
  
  #Indicate password is required here
  has_secure_password

  # Indicate all the associations this model has to other models
  has_many :user_role_in_events
  has_many :user_role_in_submissions
  has_many :user_role_in_teams
  has_many :events, through: :user_role_in_events
  has_many :submissions, through: :user_role_in_submissions
  has_many :teams, through: :user_role_in_teams

  # These are the requirements in the user
  validates :username, presence: true, uniqueness: true , length: { minimum: 2 }
  validates :password, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, on: :create, uniqueness: { case_sensitive: false }

private
  def default_values
    self.status ||= NORMAL_STATUS
  end
end
