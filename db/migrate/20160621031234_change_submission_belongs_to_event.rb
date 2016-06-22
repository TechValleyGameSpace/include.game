class ChangeSubmissionBelongsToEvent < ActiveRecord::Migration
  def change
    add_reference :submissions, :event, index: true, foreign_key: true
  end
end
