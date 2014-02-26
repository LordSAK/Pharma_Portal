class CreateSpends < ActiveRecord::Migration
  def change
    create_table :spends do |t|
      t.integer :SpendID
      t.datetime :Date
      t.string :SpendActivity
      t.string :SpendDetail
      t.string :BusinessPurpose
      t.decimal :Amount
      t.string :RecipentCategory
      t.string :RecipentType
      t.string :RecipentState

      t.timestamps
    end
  end
end
