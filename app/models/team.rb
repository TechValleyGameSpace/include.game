class Team < ActiveRecord::Base
  has_many :team_role_in_events
  has_many :team_role_in_submissions
  has_many :user_role_in_teams
  has_many :events, through: :user_role_in_events
  has_many :submissions, through: :user_role_in_submissions
  has_many :users, through: :user_role_in_teams
end
