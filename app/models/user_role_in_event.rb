class UserRoleInEvent < ActiveRecord::Base
  belongs_to :users
  belongs_to :events
end
