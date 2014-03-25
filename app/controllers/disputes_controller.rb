class DisputesController < ApplicationController

	def new
		@spend_id = params[:format]
	end
	
	def create
		if Dispute.where(:AmountID => params[:id]).blank?
			@dispute=Dispute.new(:AmountID => params[:id],:Status => params[:status],:Description => params[:Description],:DisputeDate => params[:DisputeDate])
			@dispute.save
		else
			@dispute1=Dispute.where("AmountID = ?",  params[:id])
			@dispute1.first.update_attribute(:Status, params[:status])
			@dispute1.first.update_attribute(:Description, params[:Description])
			@dispute1.first.update_attribute(:DisputeDate, params[:DisputeDate])
		end
		redirect_to '/index'
	end

	def edit
	end

	def index
		#@spends=TransferOfValue.all
		@dispute=Dispute.joins("inner join transfer_of_values on disputes.AmountID = transfer_of_values.id")
	end

	def show
	end
end