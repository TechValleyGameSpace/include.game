# Events should never be destroyed
class Event < ActiveRecord::Base
  # Define status enum
  enum status: {
    draft: 0,
    canceled: 1,
    open_to_public: 2,
    invite_only: 3
  }
  
  has_many :submissions
  has_many :user_role_in_events
  has_many :users, through: :user_role_in_events

  # These are the requirements in events
  validates :start, presence: true
  validates :end, presence: true
  validates :address, presence: true
  validates :name, presence: true, uniqueness: { scope: [:start, :latitude, :longitude] }
  validates_associated :user_role_in_events
  
  validates_datetime :start, :on => :create, :after => :today
  validates_datetime :end, :after => :start
  
  # Handle geo-coding
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
