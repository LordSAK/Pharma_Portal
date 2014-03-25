class CreateDisputes < ActiveRecord::Migration
  def change
    create_table :disputes do |t|
      t.integer :AmountID
      t.string :Description
      t.string :Status
      t.datetime :DisputeDate
      t.datetime :ResolveDate

      t.timestamps
    end
  end
end
