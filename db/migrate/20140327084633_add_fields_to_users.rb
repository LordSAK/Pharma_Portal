class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teachingHospitalName, :string
    add_column :users, :teachingHospitalTaxIDNumber, :string
    add_column :users, :physicianFirstName, :string
    add_column :users, :physicianMiddleName, :string
    add_column :users, :physicianLastName, :string
    add_column :users, :suffix, :string
    add_column :users, :businessAddress, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :country, :string
    add_column :users, :province, :string
    add_column :users, :postalCode, :string
#    add_column :users, :email, :string
    add_column :users, :physicianPrimaryType, :string
    add_column :users, :physicianNPI, :string
    add_column :users, :physicianSpecialty, :string
    add_column :users, :physicianLicenseState, :string
    add_column :users, :physicianLicenseNumber, :string
  end
end
