class CreateGroomPictures < ActiveRecord::Migration
  def change
    create_table :groom_pictures do |t|
      t.string :description
      t.string :image
      t.integer :groom_gallery_id

      t.timestamps
    end
  end
end

