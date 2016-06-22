class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, index: true
      t.text :description
      t.binary :header_image
      t.binary :icon_image
      t.date :start, index: true
      t.date :end
      t.date :submission_grace_period
      t.boolean :submission_open
      t.integer :status

      t.timestamps null: false
    end
  end
end
