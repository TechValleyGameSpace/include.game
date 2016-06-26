class Submission < ActiveRecord::Base
  # Define status enum
  enum status: {
    draft: 0,
    visible_to_public: 1,
    visible_to_attendees_only: 2,
    visible_to_judges_only: 3
  }
  
  # Indicate a submission must belong to an event
  belongs_to :events

  has_many :user_role_in_submissions, dependent: :destroy
  has_many :team_role_in_submissions, dependent: :destroy
  has_many :users, through: :user_role_in_submissions
  has_many :team, through: :team_role_in_submissions

  # These are the requirements in teams
  validates :name, presence: true, uniqueness: { scope: [:events_id] }, length: { minimum: 2 }
  validates_associated :events, :user_role_in_submissions
end
