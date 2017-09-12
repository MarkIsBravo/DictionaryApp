class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        username = user_params[:username]
        password = user_params[:password]

        user = User.find_by_credentials(username, password)

        if user
            sign_in(user)
            flash[:notice] = 'Logged in successfully'
            redirect_to user_path(user)
        else
            flash[:error] = 'Username or password incorrect'
            @user = User.new(username: username)
            render :new
        end
    end

    def destroy
        sign_out
        flash[:notice] = 'Logged out'
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
