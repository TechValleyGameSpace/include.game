class UserRoleInEvent < ActiveRecord::Base
  # Define status enum
  enum status: [ :participant, :owner, :organizer, :judge, :invited ]

  belongs_to :users
  belongs_to :events

  def associated_user
    if user_id
      User.find(user_id)
    end
  end

  def associated_username
    user = associated_user
    if user
      user.username
    end
  end
end
