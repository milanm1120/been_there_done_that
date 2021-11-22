class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id            #sessions[:user_id] is used to login
            redirect_to user_path(@user)
        else
            render :new
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