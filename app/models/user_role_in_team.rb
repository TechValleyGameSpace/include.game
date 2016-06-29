class UserRoleInTeam < ActiveRecord::Base
  # Define status enum
  enum status: [ :member, :owner ]

  belongs_to :user
  belongs_to :team
end
