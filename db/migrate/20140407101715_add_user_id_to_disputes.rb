class AddUserIdToDisputes < ActiveRecord::Migration
  def change
    add_column :disputes, :UserID, :integer
  end
end
