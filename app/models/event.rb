class Event < ActiveRecord::Base
  has_many :submissions
  has_many :user_role_in_events
  has_many :users, through: :user_role_in_events
end
