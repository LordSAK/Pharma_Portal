class CreateGeneralRecords < ActiveRecord::Migration
	def change
		create_table :general_records do |t|
			t.string :PhysicianOwnershipIndicator
			t.string :ThirdPartyPayemntRecipientIndicator
			t.string :NameofThirdParty
			t.string :Charity
			t.string :ThirdPartyEqualsCoveredRecipientIndicator
			t.string :ContextualInformation
			t.string :DelayinPublishResearchIndicator
			t.integer :AmountID

	      t.timestamps
    	end
  	end
end
