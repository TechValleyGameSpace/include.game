class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, index: true, unique: true
      t.text :description
#      t.binary :team_image
      t.integer :status, index: true, null: false, default: 0

      t.timestamps null: false
    end
  end
end
