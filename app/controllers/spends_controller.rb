class SpendsController < ApplicationController
  def new
  end

  def edit
  end

  def index
  	@spends=Spend.all
  end

  def show
  	@spends=Spend.find(params[:id])
  end
end
