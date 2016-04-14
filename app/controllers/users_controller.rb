class UsersController < ApplicationController

	def show
    	@user = User.find(params[:id])
  	end

  	def new
    	@user = User.new
  	end

  	def create
  		@user = User.new
  		if @user.save
  			redirect_to edit_user_path(current_user.id)
  		else 
  			redirect_to user_path(current_user.id)
  		end
  	end 

  	def edit
    	@user = User.find(params[:id])
  	end

  	def update
  		@user = User.find(params[:id])
  		if @user.update(user_params)
    		redirect_to user_path(current_user.id)
    	else
      		render 'edit'
    	end
  	end

  private

	def user_params
	    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :confirmation_token, :remember_token, :avatar)
	end
end

   