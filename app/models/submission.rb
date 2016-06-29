class Submission < ActiveRecord::Base
  # Define status enum
  enum status: {
    draft: 0,
    visible_to_public: 1,
    visible_to_attendees_only: 2,
    visible_to_judges_only: 3
  }

  # Indicate a submission must belong to an event
  belongs_to :event

  has_many :downloads, dependent: :destroy
  has_many :user_role_in_submissions, dependent: :destroy
  has_many :team_role_in_submissions, dependent: :destroy
  has_many :users, through: :user_role_in_submissions
  has_many :teams, through: :team_role_in_submissions

  # These are the requirements in teams
  validates :name, presence: true, uniqueness: { scope: [:event_id] }, length: { minimum: 2 }
  validates_associated :event, :user_role_in_submissions
end
