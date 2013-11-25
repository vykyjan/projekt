class CreateAddColumnToGalleries < ActiveRecord::Migration
  def change
    add_column :groom_galleries, :token, :string
  end
end
