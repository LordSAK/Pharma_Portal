class FixColumnNameUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :name, :FirstName
  	add_column :users, :LastName, :string 
  end
end
