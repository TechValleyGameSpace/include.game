# Events should never be destroyed
class Event < ActiveRecord::Base
  SUBMISSION_CLOSED = 0
  SUBMISSION_OPEN = 1
  SUBMISSION_ADMIN_ONLY = 2

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
  validates :address, presence: true, length: { minimum: 2 }
  validates :name, presence: true, uniqueness: { scope: [:start, :latitude, :longitude] }
  validates_associated :user_role_in_events

  validates_datetime :start, :on => :create, :after => :today
  validates_datetime :end, :after => :start

  # Handle geo-coding
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def is_live?
    return (!draft? and !canceled?)
  end

  def Event.submissions_status(event)
    returnStatus = SUBMISSION_CLOSED
    if event.is_live?
      if Time.current.between?(event.start, event.end)
        returnStatus = SUBMISSION_OPEN
      elsif Time.current < event.end
        returnStatus = SUBMISSION_ADMIN_ONLY
      end
    elsif event.is_canceled?
      returnStatus = SUBMISSION_ADMIN_ONLY
    end
    return returnStatus
  end
end
