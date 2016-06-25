class CreateSubmissions < ActiveRecord::Migration
  def change
    # Create the initial table
    create_table :submissions do |t|
      t.string :name, index: true
      t.text :description
      t.binary :header_image
      t.binary :icon_image
      t.integer :status, index: true, null: false

      t.belongs_to :event, index: true, null: false

      t.timestamps null: false
    end

    # Add uniqueness test on submission
    add_index :submissions, [:name, :event_id], unique: true
  end
end
