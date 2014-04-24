class FormOfPaymentInTransferOfValues < ActiveRecord::Migration
  def change
  	add_column :transfer_of_values, :form_of_payment, :string
  end
end
