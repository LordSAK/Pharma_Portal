class TransferOfValueController < ApplicationController


    respond_to :html, :json
    def new
        
    end


    def recipients
        puts "id= "+params[:id]
        @rec=Recipient.find(params[:ids])

        @rec.update_attribute(:recipientType,params[:RecipientType])
        if params[:RecipientType] == "Physician"
            @rec.update_attribute(:physicianFirstName,params[:FirstName])
            @rec.update_attribute(:physicianMiddleName,params[:MiddleName])
            @rec.update_attribute(:physicianLastName,params[:LastName])
            @rec.update_attribute(:suffix,params[:Suffix])
            @rec.update_attribute(:businessAddress,params[:address])
            @rec.update_attribute(:city,params[:city])
            @rec.update_attribute(:state,params[:State])
            @rec.update_attribute(:zip,params[:zip])
        else
            @rec.update_attribute(:teachingHospitalName,params[:Hospital])
            @rec.update_attribute(:businessAddress,params[:address])
            @rec.update_attribute(:city,params[:city])
            @rec.update_attribute(:state,params[:State])
            @rec.update_attribute(:zip,params[:zip])
        end
        redirect_to transfer_of_value_path(params[:id])
    end

    def spends

        puts "id= "+params[:id]
        @spen=TransferOfValue.find(params[:id])

        @spen.update_attribute(:paymentName,params[:title])
        @spen.update_attribute(:totalAmount,params[:amount])
        @spen.update_attribute(:NatureofPayment,params[:purpose])
        @spen.update_attribute(:numberofPayment,params[:num_of_pay])
        @spen.update_attribute(:DateofPayment,params[:spend_date])
        
        redirect_to transfer_of_value_path(params[:id])
    end

    def party
        @party=GeneralRecord.find(params[:ids])

        @party.update_attribute(:ThirdPartyPayemntRecipientIndicator,params[:Party])
        @party.update_attribute(:NameofThirdParty,params[:name_of_party])
        @party.update_attribute(:Charity,params[:charity])
        @party.update_attribute(:ContextualInformation,params[:info])

        redirect_to transfer_of_value_path(params[:id])        
    end

    def product
        AssociatedProduct.delete_all(:AmountID => params[:id])
        params[:category].each do |keycateg, category,nameofDeviceorMedicalSupply,nameofDrugorBiological|
            if category == "Drug or Biological"
                @prod = AssociatedProduct.new(:AmountID => params[:id], :nameofDrugorBiological => nameofDrugorBiological  )
               # @prod.save
            else
                @prod = AssociatedProduct.new(:AmountID => params[:id], :nameofDeviceorMedicalSupply => nameofDeviceorMedicalSupply)
            end
        end
        
        #if !params[:parametersSch].blank?
            
        #@Education = Education.new( :UserID => current_user.id, :SchoolName => @degree, :SchoolFrom => @from, :SchoolTo => @to )
       # @Education.save
        redirect_to transfer_of_value_path(params[:id])  



    end

    def update
    end

    def edit
        @spends=TransferOfValue.find(params[:id])
        @Recipients=Recipient.where('"AmountID" = ?',params[:id])
        @Products= AssociatedProduct.where('"AmountID" = ?',params[:id])
        @ThirdParty=GeneralRecord.where('"AmountID" = ?', params[:id])
    end

    def index
  	   @spends=TransferOfValue.all
    end

    def show
  	   @spends=TransferOfValue.find(params[:id])
       @Recipients=Recipient.where('"AmountID" = ?',params[:id])
  	   @Products= AssociatedProduct.where('"AmountID" = ?',params[:id])
  	   @ThirdParty=GeneralRecord.where('"AmountID" = ?', params[:id])
    end
end