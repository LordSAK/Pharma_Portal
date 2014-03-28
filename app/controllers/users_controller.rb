class UsersController < ApplicationController

	def show
		@user= User.find(params[:id])
		@user_name=@user.FirstName
		if !@user.LastName.blank?
			@user_name += " "+@user.LastName
		end
	end

	def new
		@user=User.new
	end

	def create
		if params[:userType] == "Physician"
			@user=User.new(:userType => params[:userType], 
				:physicianFirstName => params[:physicianFirstName], 
				:physicianMiddleName => params[:physicianMiddleName],
				:physicianLastName => params[:physicianLastName], 
				:suffix => params[:suffix], 
				:businessAddress => params[:businessAddress], 
				:city => params[:city],	:state => params[:state], 
				:zip => params[:zip], :country => params[:country], 
				:physicianPrimaryType => params[:physicianPrimaryType], 
				:physicianNPI => params[:physicianNPI], 
				:physicianSpecialty => params[:physicianSpecialty], 
				:physicianLicenseState => params[:physicianLicenseState], 
				:physicianLicenseNumber => params[:physicianLicenseNumber],
				:password => params[:password],
				:password_confirmation => params[:password_confirmation],
				:email => params[:email])
			@user.save
			puts @user.errors.full_messages
		elsif params[:userType] == "Hospital"
			@user=User.new(:userType => params[:userType],
				:teachingHospitalName => params[:teachingHospitalName],
				:teachingHospitalTaxIDNumber => params[:teachingHospitalTaxIDNumber],
				:email => params[:email1],
				:password => params[:password1],
				:password_confirmation => params[:password_confirmation1],
				:businessAddress => params[:businessAddress1], 
				:city => params[:city1],	:state => params[:state1], 
				:zip => params[:zip1], :country => params[:country1])
			@user.save
			puts @user.errors.full_messages
		else
			@user=User.new(:userType => params[:userType],
				:suffix => params[:suffix1], 
				:FirstName => params[:FirstName],
				:LastName => params[:LastName],
				:email => params[:email2],
				:password => params[:password2],
				:password_confirmation => params[:password_confirmation2])
			@user.save
		end
		#@user = User.new(user_params)
		#if @user.save
		#	sign_in @user
			#flash[:success] = "Welcome to the Pharma Portal!"
		#	redirect_to '/dashboard'
		#else
			render 'new'
		#end
	end

	private

	def user_params
      params.require(:user).permit(:FirstName, :LastName, :email, :password,
                                   :password_confirmation)
    end
end
