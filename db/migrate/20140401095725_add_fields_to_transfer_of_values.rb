class AddFieldsToTransferOfValues < ActiveRecord::Migration
  def change
    add_column :transfer_of_values, :ActivityType, :string
    add_column :transfer_of_values, :DetailType, :string
  end
end
