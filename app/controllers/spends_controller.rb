class SpendsController < ApplicationController
  def new
  end

  def edit
    @spends=TransferOfValue.find(params[:id])
  end

  def index
  	@spend=TransferOfValue.all
  end

  def show
  	@spends=TransferOfValue.find(params[:id])
  end
end
