class CreateUserRoleInEvents < ActiveRecord::Migration
  def change
    create_table :user_role_in_events do |t|
      t.text :message
      t.integer :status, index: true, null: false, default: 0

      t.belongs_to :user, index: true, null: false
      t.belongs_to :event, index: true, null: false

      t.timestamps null: false
    end

    # Add uniqueness test on all associations
    add_index :user_role_in_events, [:user_id, :event_id], unique: true
  end
end
