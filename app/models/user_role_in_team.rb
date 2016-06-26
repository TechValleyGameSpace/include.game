class UserRoleInTeam < ActiveRecord::Base
  # Define status enum
  enum status: [ :member, :owner ]

  belongs_to :users
  belongs_to :teams
end
