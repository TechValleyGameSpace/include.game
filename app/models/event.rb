class Event < ActiveRecord::Base
  has_many :submissions
  has_many :user_role_in_events
  has_many :users, through: :user_role_in_events

  # These are the requirements in events
  validates :start, presence: true
  validates :end, presence: true
  validates :name, presence: true, uniqueness: { scope: [:start] } #FIXME: add geocoord
  validates_associated :user_role_in_events
end
