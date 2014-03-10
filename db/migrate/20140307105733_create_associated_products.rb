class CreateAssociatedProducts < ActiveRecord::Migration
	def change
		create_table :associated_products do |t|
			t.string :productIndicator 
	 		t.string :nameofDrugorBiological
  			t.string :NDCofDrugorBiological
  			t.string :nameofDeviceorMedicalSupply
			t.integer :AmountID

		    t.timestamps
    	end
  	end
end
