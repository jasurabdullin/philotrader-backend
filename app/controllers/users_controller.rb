class UsersController < ApplicationController
    
    def index
        render json: User.all
    end
    
    def login

        if User.exists?(username: params[:username]) == true
            user = User.find_by(username: params[:username])
                if user[:password] == params[:password]
                    render json: user
                else
                    render json: {error: 'Invalid password'}
                end
        else
            render json: {error:'Invalid username'}
        end

    end
    
    def create
        new_user = User.create(user_params)
        render json: new_user
    end

    private

	def user_params

		params.require(:user).permit(:firstname, :lastname, :username, :password, :description)

	end
end
