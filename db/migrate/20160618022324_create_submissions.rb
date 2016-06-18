class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :description
      t.binary :header_image
      t.binary :icon_image
      t.date :submitted
      t.date :updated

      t.timestamps null: false
    end
  end
end
