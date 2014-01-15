class AddTextABooleanToPresents < ActiveRecord::Migration
  def change
    add_column :presents, :text, :text
    add_column :presents, :boolean, :boolean, :default => false
  end
end
