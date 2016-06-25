class CreateUserRoleInSubmissions < ActiveRecord::Migration
  def change
    create_table :user_role_in_submissions do |t|
      t.text :role
      t.integer :status

      t.belongs_to :user, index: true, null: false
      t.belongs_to :submission, index: true, null: false

      t.timestamps null: false
    end

    # Add uniqueness test on all associations
    add_index :user_role_in_submissions, [:user_id, :submission_id], unique: true
  end
end
