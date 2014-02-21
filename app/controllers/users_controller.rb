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
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			#flash[:success] = "Welcome to the Pharma Portal!"
			redirect_to '/dashboard'
		else
			render 'new'
		end
	end

	private

	def user_params
      params.require(:user).permit(:FirstName, :LastName, :email, :password,
                                   :password_confirmation)
    end
end
