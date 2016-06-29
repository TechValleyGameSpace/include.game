class UserRoleInSubmission < ActiveRecord::Base
  # Define status enum
  enum status: [ :developer, :owner ]

  belongs_to :user
  belongs_to :submission

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
