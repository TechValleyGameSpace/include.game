class CreateUserRoleInTeams < ActiveRecord::Migration
  def change
    create_table :user_role_in_teams do |t|
      t.text :role
      t.integer :status

      t.belongs_to :user, index: true, null: false
      t.belongs_to :team, index: true, null: false

      t.timestamps null: false
    end

    # Add uniqueness test on all associations
    add_index :user_role_in_teams, [:user_id, :team_id], unique: true
  end
end
