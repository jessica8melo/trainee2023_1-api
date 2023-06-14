class UsersController < ApplicationController
    def login
        user = User.find_by(email: login_params[:email])
        if user.valid_password?(login_params[:password])
            render json: user, status: :ok
        else
            head :unauthorized
        end
    rescue StandardError => e
        head :unauthorized
    end

    private
    def login_params
        params.require(:user).permit(:email, :password)
    end
end
