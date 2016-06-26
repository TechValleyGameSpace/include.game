class UserRoleInSubmission < ActiveRecord::Base
  # Define status enum
  enum status: [ :developer, :owner ]

  belongs_to :users
  belongs_to :submissions
end
