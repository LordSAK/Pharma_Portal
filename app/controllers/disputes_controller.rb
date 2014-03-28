class DisputesController < ApplicationController

	def new
		@spend_id = params[:format]
	end
	
	def create
		if Dispute.where(:AmountID => params[:id]).blank?
			@date=Date.strptime params[:DisputeDate], '%m-%d-%Y'
			@dispute=Dispute.new(:AmountID => params[:id],:Status => params[:status],:Description => params[:Description],:DisputeDate => @date)
			@dispute.save
		else
			@dispute1=Dispute.where('"AmountID" = ?',  params[:id])
			@dispute1.first.update_attribute(:Status, params[:status])
			@dispute1.first.update_attribute(:Description, params[:Description])
			@date=Date.strptime params[:DisputeDate], '%m-%d-%Y'
			@dispute1.first.update_attribute(:DisputeDate, @date)
		end
		redirect_to '/transfer_of_value'
	end

	def edit
	end

	def index
		#@spends=TransferOfValue.all
		@dispute=Dispute.joins('inner join "transfer_of_values" on "disputes"."AmountID" = "transfer_of_values"."id"')
	end

	def show
	end
end