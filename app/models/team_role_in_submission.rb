class TeamRoleInSubmission < ActiveRecord::Base
  belongs_to :teams
  belongs_to :submissions
end
