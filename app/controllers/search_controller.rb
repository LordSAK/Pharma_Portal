class SearchController < ApplicationController
  def Search
  	start=Date.strptime params[:Start], '%m-%d-%Y' unless params[:Start]==""
	  ends=Date.strptime params[:End], '%m-%d-%Y' unless params[:End].nil==""
  	userType=params[:UserType] unless params[:UserType]=="All"
  	state=params[:State] unless params[:State]=="All"
  	activity=params[:ActivityType] unless params[:ActivityType]=="All"
  	detail=params[:DetailType] unless params[:DetailType]=="All"
  	nature=params[:NatureOfPayment] unless params[:NatureOfPayment]=="All"
  	@result=TransferOfValue.joins('inner join "recipient_amounts" on "transfer_of_values"."id"="recipient_amounts"."AmountID" inner join "users" on "recipient_amounts"."RecipientID"="users"."id"').where('(? is null or "transfer_of_values"."DateofPayment" >= ? ) and (? is null or "transfer_of_values"."DateofPayment" <= ?) and (? is null or "users"."userType"=?) and (? is null or "users"."state"=?) and (? is null or "transfer_of_values"."ActivityType"=?) and (? is null or "transfer_of_values"."DetailType"=?) and (? is null or "transfer_of_values"."NatureofPayment"=?)',start,start,ends,ends,userType,userType,state,state,activity,activity,detail,detail,nature,nature)
    @start= params[:Start]
    @ends= params[:End]
    @userType=params[:UserType] 
    @state=params[:State] 
    @activity=params[:ActivityType] 
    @detail=params[:DetailType] 
    @nature=params[:NatureOfPayment] 
  end

  def SearchDisputes
  	start=Date.strptime params[:Start], '%m-%d-%Y' unless params[:Start]==""
  	ends=Date.strptime params[:End], '%m-%d-%Y' unless params[:End]==""
	  status=params[:status] unless params[:status]=="All"
	  exceptions=params[:Exception] unless params[:Exception]=="All"
	  @dispute=Dispute.joins('inner join "transfer_of_values" on "disputes"."AmountID" = "transfer_of_values"."id"').where('(? is null or "disputes"."DisputeDate" >= ? ) and (? is null or "disputes"."DisputeDate" <= ?) and (? is null or "disputes"."Status" = ? ) and (? is null or "disputes"."Description"=?)',start,start,ends,ends,status,status,exceptions,exceptions)
    @start=params[:Start]
    @ends=params[:End]
    @status=params[:status]
    @exceptions=params[:Exception]
  end
end
