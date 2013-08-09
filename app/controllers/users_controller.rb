class UsersController < ApplicationController
#load_and_authorize_resource

before_filter :authenticate_user!   #Include devise for users

	
	def show
		@user = User.find(params[:id])
	end

	#private  REACTIVATE AFTER MAKING DEVISE WORK

   # def user_params
     # params.require(:user).permit(:email, :first_name, :last_name, :username, :role, :rank, :city, :description, :password, :password_confirmation)  #I THINK I HAVE TO TAKE ROLE OUR OF HERE
    #end

end
