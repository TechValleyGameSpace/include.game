class Team < ActiveRecord::Base
  has_many :user_role_in_teams
  has_many :team_role_in_submissions
  has_many :users, through: :user_role_in_teams
  has_many :submissions, through: :team_role_in_submissions

  # These are the requirements in teams
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates_associated :user_role_in_teams
end
