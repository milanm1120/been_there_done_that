class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to destinations_path
        else
            flash[:message] = "Login failed. Please login or sign up. "
            redirect_to '/login'
        end
    end

    def omniauth
        user = User.find_or_create_by(uid: auth['uid']) do |u|            #auth is a private method
            u.firstname = auth['info']['first_name']
            u.lastname = auth['info']['last_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(20)
        end
        if user.valid?
            session[:user_id] = user.id
            flash[:message] = "Successful Login!"
            redirect_to destinations_path
        else
            redirect_to destinations_path
        end
        #firstname
        #lastname
        #email
        #password
        #uid
        #provider
    end

    def destroy
        session.delete(:user_id)
        redirect_to destinations_path
    end

    private

    def  auth
        request.env['omniauth.auth']
    end

end