class CreateRecipients < ActiveRecord::Migration
	def change
		create_table :recipients do |t|
			t.string :recipientType
		  	t.string :teachingHospitalName
			t.string :teachingHospitalTaxIDNumber
			t.string :physicianFirstName
			t.string :physicianMiddleName
			t.string :physicianLastName
			t.string :suffix
			t.string :businessAddress
			t.string :city
			t.string :state
			t.string :zip
			t.string :country
			t.string :province
			t.string :postalCode
			t.string :email
			t.string :physicianPrimaryType
			t.string :physicianNPI
			t.string :physicianSpecialty
			t.string :physicianLicenseState
			t.string :physicianLicenseNumber
			t.integer :AmountID

			t.timestamps
    	end
  	end
end
