class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.binary :team_image

      t.timestamps null: false
    end
  end
end
