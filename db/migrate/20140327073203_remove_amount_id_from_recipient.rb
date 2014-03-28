class RemoveAmountIdFromRecipient < ActiveRecord::Migration
  def change
    remove_column :recipients, :AmountID, :integer
  end
end
