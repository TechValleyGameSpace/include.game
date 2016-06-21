class Submission < ActiveRecord::Base
  belongs_to :events
  has_many :user_role_in_submissions
  has_many :team_role_in_submissions
  has_many :users, through: :user_role_in_submissions
  has_many :team, through: :team_role_in_submissions
end