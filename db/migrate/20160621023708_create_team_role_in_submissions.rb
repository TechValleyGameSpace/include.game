class CreateTeamRoleInSubmissions < ActiveRecord::Migration
  def change
    create_table :team_role_in_submissions do |t|
      t.text :role

      t.belongs_to :team, index: true, null: false
      t.belongs_to :submission, index: true, null: false

      t.timestamps null: false
    end

    # Add uniqueness test on all associations
    add_index :team_role_in_submissions, [:team_id, :submission_id], unique: true
  end
end
