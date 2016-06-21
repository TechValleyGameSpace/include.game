class UserRoleInSubmission < ActiveRecord::Base
  belongs_to :users
  belongs_to :submissions
end
