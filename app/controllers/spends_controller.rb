class SpendsController < ApplicationController
  def new
  end

  def edit
    @spends=Spend.find(params[:id])
  end

  def index
  	@spends=Spend.all
  end

  def show
  	@spends=Spend.find(params[:id])
  end
end
