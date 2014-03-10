class TransferOfValueController < ApplicationController
 def new
  end

  def edit
    @spends=TransferOfValue.find(params[:id])
  end

  def index
  	@spends=TransferOfValue.all
  end

  def show
  	@spends=TransferOfValue.find(params[:id])
  	@Recipients=Recipient.where('AmountID = ?',params[:id])
  	@Products= AssociatedProduct.where('AmountID = ?',params[:id])
  	@ThirdParty=GeneralRecord.where('AmountID = ?', params[:id])
  end
end
