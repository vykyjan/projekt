class CreateAddColumnToPictures < ActiveRecord::Migration
  def change
      add_column :groom_pictures, :gallery_token, :string
    end
  end