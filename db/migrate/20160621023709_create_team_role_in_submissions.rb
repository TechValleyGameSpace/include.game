class CreateTeamRoleInSubmissions < ActiveRecord::Migration
  def change
    create_table :team_role_in_submissions do |t|
      t.text :role

      t.belongs_to :team, index: true,
      t.belongs_to :submission, index: true,

      t.timestamps null: false
    end
  end
end
