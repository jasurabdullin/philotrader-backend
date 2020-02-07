class UsersController < ApplicationController
    
    def index
        render json: User.all
    end
    
    def login
        user = User.find_by(username: params[:username])
        render json: user
    end
    
    def create
        new_user = User.create(user_params)
        render json: new_user
    end

    private

	def user_params

		params.require(:user).permit(:firstname, :lastname, :username, :description)

	end
end
