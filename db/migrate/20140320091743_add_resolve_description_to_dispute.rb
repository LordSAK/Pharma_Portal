class AddResolveDescriptionToDispute < ActiveRecord::Migration
  def change
    add_column :disputes, :ResolveDescription, :string
  end
end
