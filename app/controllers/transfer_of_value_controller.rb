class TransferOfValueController < ApplicationController
    respond_to :html, :json

    def new       
    end

    def create
         @spen=TransferOfValue.new(:paymentName => params[:title],:totalAmount => params[:amount] ,:NatureofPayment => params[:purpose], :numberofPayment => params[:num_of_pay],:DateofPayment => params[:spend_date])
         @spen.save
         @spend_id=TransferOfValue.last.id

         if params[:RecipientType] == "Physician"
            @rec=Recipient.new(:recipientType => params[:RecipientType],:physicianFirstName => params[:FirstName],:physicianMiddleName => params[:MiddleName],:physicianLastName =>params[:LastName],:suffix => params[:Suffix],:businessAddress => params[:address],:city =>params[:city],:state => params[:State],:zip => params[:zip], :AmountID => @spend_id)
            @rec.save
        else
            @rec=Recipient.new(:recipientType => params[:RecipientType],:teachingHospitalName => params[:Hospital],:businessAddress => params[:address],:city => params[:city],:state => params[:State],:zip => params[:zip], :AmountID => @spend_id)
            @rec.save
        end

       
         @party=GeneralRecord.new(:ThirdPartyPayemntRecipientIndicator => params[:Party],:NameofThirdParty => params[:name_of_party],:Charity => params[:charity],:ContextualInformation => params[:info], :AmountID => @spend_id)
         @party.save


        if params[:category] == "Drug or Biological"
            @prod = AssociatedProduct.new(:AmountID => @spend_id, :nameofDrugorBiological => params[:name] )
            @prod.save
        else
            @prod = AssociatedProduct.new(:AmountID => @spend_id, :nameofDeviceorMedicalSupply => params[:name])
            @prod.save
        end

        if params[:product].present?
            params[:product].each_with_index do |(key,name1),k|
                params[:category1].each_with_index do |(key,category1),l|
                    if k == l
                        print "#{name1}"
                        puts ","
                        puts category1

                        if category1 == "Drug or Biological"
                             @prod = AssociatedProduct.new(:AmountID => @spend_id, :nameofDrugorBiological => name1 )
                             @prod.save
                        else
                             @prod = AssociatedProduct.new(:AmountID => @spend_id, :nameofDeviceorMedicalSupply => name1)
                             @prod.save
                        end
                    end
                end
            end
        end

        redirect_to transfer_of_value_path(@spend_id)
    end

    def update
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
        params[:name].each_with_index do |(key,name),i|
            params[:category].each_with_index do |(key,category),j|
                if i == j
                    print "#{name}"
                    puts ","
                    puts category

                    if category == "Drug or Biological"
                         @prod = AssociatedProduct.new(:AmountID => params[:id], :nameofDrugorBiological => name )
                         @prod.save
                    else
                         @prod = AssociatedProduct.new(:AmountID => params[:id], :nameofDeviceorMedicalSupply => name)
                         @prod.save
                    end
                end
            end
        end

        params[:product].each_with_index do |(key,name1),k|
            params[:category1].each_with_index do |(key,category1),l|
                if k == l
                    print "#{name1}"
                    puts ","
                    puts category1

                    if category1 == "Drug or Biological"
                         @prod = AssociatedProduct.new(:AmountID => params[:id], :nameofDrugorBiological => name1 )
                         @prod.save
                    else
                         @prod = AssociatedProduct.new(:AmountID => params[:id], :nameofDeviceorMedicalSupply => name1)
                         @prod.save
                    end
                end
            end
        end

        
        #if !params[:parametersSch].blank?
            
        #@Education = Education.new( :UserID => current_user.id, :SchoolName => @degree, :SchoolFrom => @from, :SchoolTo => @to )
       # @Education.save
        redirect_to transfer_of_value_path(params[:id])  
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