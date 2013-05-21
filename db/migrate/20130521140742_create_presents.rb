class CreatePresents < ActiveRecord::Migration
  def change
    create_table :presents do |t|
      t.string :name
      t.string :pole

      t.timestamps
    end
  end
end
