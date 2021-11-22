class SessionsController < ApplicationController

    def new

    end

    def create

    end

    def omniauth
        user = User.find_or_create_by(uid: uid_auth['uid']) do |u|            #uid_auth is a private method
            u.firstname = uid_auth['info']['first_name']
            u.lastname = uid_auth['info']['last_name']
            u.email = uid_auth['info']['email']
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

    def  uid_auth
        request.env['omniauth.auth']
    end

end