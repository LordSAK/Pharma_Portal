class CreateTransferOfValues < ActiveRecord::Migration
	def change
		create_table :transfer_of_values do |t|
			t.string :paymentName
			t.integer :totalAmount
			t.datetime :DateofPayment
			t.integer :numberofPayment
			t.string :NatureofPayment
			t.string :City
			t.string :State
			t.string :Country

		    t.timestamps
    	end
  	end
end
