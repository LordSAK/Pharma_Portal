class AddUserTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userType, :string
  end
end
