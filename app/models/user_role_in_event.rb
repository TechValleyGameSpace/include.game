class UserRoleInEvent < ActiveRecord::Base
  # Define status enum
  enum status: [ :participant, :owner, :organizer, :judge, :invited ]
  
  belongs_to :users
  belongs_to :events
  
  def username
    user = User.find(user_id)
    if user
      user.username
    end
  end
end
