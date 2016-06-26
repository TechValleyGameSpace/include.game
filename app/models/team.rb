class Team < ActiveRecord::Base
  # Define status enum
  enum status: {
    draft: 0,
    visible_to_public: 1,
    visible_to_team_members_only: 2
  }
  
  has_many :user_role_in_teams, dependent: :destroy
  has_many :team_role_in_submissions, dependent: :destroy
  has_many :users, through: :user_role_in_teams
  has_many :submissions, through: :team_role_in_submissions

  # These are the requirements in teams
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates_associated :user_role_in_teams
end
