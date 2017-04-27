class UsersController < ApplicationController
	before_action :find_params, only: [:show, :edit, :new]
	def index
		@user = User.new
	end

	def edit
	end

	def new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			flash[:success_notice] = "Welcome #{ user.first_name }"
			redirect_to '/songs'
		else
			flash[:new_user_errors] = user.errors.full_messages
			redirect_to '/'
		end
	end

	def show
	end

	def login
		@user = User.find_by_email(params[:user][:email])
		if @user.present? && @user = @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to '/songs'
		else
			flash[:login_alert] = "Login Failed: Credantial not valid"
			redirect_to '/'
		end
	end

	def logout
		session.clear
		flash[:logout_alert] = "You have successfully logged out!"
		redirect_to '/'
	end

	private
		def find_params
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
