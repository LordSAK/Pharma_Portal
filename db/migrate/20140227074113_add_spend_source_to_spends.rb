class AddSpendSourceToSpends < ActiveRecord::Migration
  def change
  	add_column :spends, :spend_description, :string
  	add_column :spends, :payment_date, :datetime
  	add_column :spends, :source_system, :string
  	add_column :spends, :source_company, :string
  end
end
