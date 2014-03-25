# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140320091743) do

  create_table "associated_products", force: true do |t|
    t.string   "productIndicator"
    t.string   "nameofDrugorBiological"
    t.string   "NDCofDrugorBiological"
    t.string   "nameofDeviceorMedicalSupply"
    t.integer  "AmountID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disputes", force: true do |t|
    t.integer  "AmountID"
    t.string   "Description"
    t.string   "Status"
    t.datetime "DisputeDate"
    t.datetime "ResolveDate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ResolveDescription"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "general_records", force: true do |t|
    t.string   "PhysicianOwnershipIndicator"
    t.string   "ThirdPartyPayemntRecipientIndicator"
    t.string   "NameofThirdParty"
    t.string   "Charity"
    t.string   "ThirdPartyEqualsCoveredRecipientIndicator"
    t.string   "ContextualInformation"
    t.string   "DelayinPublishResearchIndicator"
    t.integer  "AmountID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipients", force: true do |t|
    t.string   "recipientType"
    t.string   "teachingHospitalName"
    t.string   "teachingHospitalTaxIDNumber"
    t.string   "physicianFirstName"
    t.string   "physicianMiddleName"
    t.string   "physicianLastName"
    t.string   "suffix"
    t.string   "businessAddress"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "province"
    t.string   "postalCode"
    t.string   "email"
    t.string   "physicianPrimaryType"
    t.string   "physicianNPI"
    t.string   "physicianSpecialty"
    t.string   "physicianLicenseState"
    t.string   "physicianLicenseNumber"
    t.integer  "AmountID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfer_of_values", force: true do |t|
    t.string   "paymentName"
    t.integer  "totalAmount"
    t.datetime "DateofPayment"
    t.integer  "numberofPayment"
    t.string   "NatureofPayment"
    t.string   "City"
    t.string   "State"
    t.string   "Country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "FirstName"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "LastName"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
