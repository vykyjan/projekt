class CreateBrideGalleries < ActiveRecord::Migration
  def change
    create_table :bride_galleries do |t|
      t.string :name
      t.string :description
      t.integer :cover
      t.string :token

      t.timestamps
    end
  end
end