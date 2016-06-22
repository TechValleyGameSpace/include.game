class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name, index: true
      t.text :description
      t.binary :header_image
      t.binary :icon_image

      t.timestamps null: false
    end
  end
end
