class UserRoleInEvent < ActiveRecord::Base
  # Define status enum
  enum status: [ :participant, :owner, :organizer, :judge, :invited ]
  
  belongs_to :users
  belongs_to :events
end
