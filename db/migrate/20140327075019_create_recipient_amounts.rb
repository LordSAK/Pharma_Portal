class CreateRecipientAmounts < ActiveRecord::Migration
  def change
    create_table :recipient_amounts do |t|
      t.integer :RecipientID
      t.integer :AmountID

      t.timestamps
    end
  end
end
