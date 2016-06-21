class TeamRoleInEvent < ActiveRecord::Base
  belongs_to :teams
  belongs_to :events
end
