class CreateUserRoleInSubmissions < ActiveRecord::Migration
  def change
    create_table :user_role_in_submissions do |t|
      t.text :role
      t.integer :status

      t.belongs_to :user, index: true
      t.belongs_to :submission, index: true

      t.timestamps null: false
    end
  end
end
