class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render 'users/new'
        end
    end

    def edit
        find_user
    end

    def update
        find_user
        @user.update(user_params)
        if @user.valid?
            redirect_to users_path(@user)
        else
            render 'user/#{@user.id}/edit'
        end
    end

    def destroy
        find_user
        @user.destroy
            redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password)
    end

    def find_user
        @user = User.find_by_id(params[:id])
    end
end