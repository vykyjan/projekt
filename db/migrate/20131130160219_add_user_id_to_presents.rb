class AddUserIdToPresents < ActiveRecord::Migration
  def change
    add_column :presents, :user_id, :integer
  end
end
