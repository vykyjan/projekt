class CreateGroomGalleries < ActiveRecord::Migration
  def change
    create_table :groom_galleries do |t|
      t.string :name
      t.string :description
      t.integer :cover

      t.timestamps
    end
  end
end