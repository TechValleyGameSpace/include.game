class AddUniqueConstraints < ActiveRecord::Migration
  def change
    # Add uniqueness test on all associations
    add_index :team_role_in_submissions, [:team_id, :submission_id], unique: true
    add_index :user_role_in_events, [:user_id, :event_id], unique: true
    add_index :user_role_in_submissions, [:user_id, :submission_id], unique: true
    add_index :user_role_in_teams, [:user_id, :team_id], unique: true

    # Add uniqueness test on submission
    add_index :submissions, [:name, :event_id], unique: true

    # Just for extra-safety, add uniqueness test in single fields
    add_index :users, :username, unique: true
    add_index :teams, :name, unique: true
  end
end
