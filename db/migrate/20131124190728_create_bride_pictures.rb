class CreateBridePictures < ActiveRecord::Migration
  def change
    create_table :bride_pictures do |t|
      t.string :description
      t.string :image
      t.integer :bride_gallery_id
      t.string :gallery_token

      t.timestamps
    end
  end
end
