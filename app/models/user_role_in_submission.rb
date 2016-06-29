class UserRoleInSubmission < ActiveRecord::Base
  # Define status enum
  enum status: [ :developer, :owner ]

  belongs_to :user
  belongs_to :submission
end
