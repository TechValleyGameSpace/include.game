class CreateUserRoleInEvents < ActiveRecord::Migration
  def change
    create_table :user_role_in_events do |t|
      t.text :message
      t.integer :status

      t.belongs_to :user, index: true
      t.belongs_to :event, index: true

      t.timestamps null: false
    end
  end
end
