class UsersController < ApplicationController
    before_action :ensure_logged_out, only: [:index, :new, :create]
    before_action :ensure_logged_in, only: [:show]
    def index
        @user_count = User.count
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        user = User.new(create_params)

        if user.save
            sign_in(user)
            flash[:notice] = 'Logged in successfully'
            redirect_to user_path(user)
        else
            errors = user.errors.full_messages
            flash[:error] = errors.join(', ')
            @user = User.new(username: create_params[:username])
            render :new
        end
    end

    private

    def create_params
        params.require(:user).permit(:username, :password)
    end
end
