class TeamRoleInSubmission < ActiveRecord::Base
  belongs_to :team
  belongs_to :submission
end
