class SessionsController < ApplicationController

    def new

    end

    def create

    end

    def omniauth
        user = User.find_or_create_by(uid: uid_auth['uid']) do |u|            #uid_auth is a private method
            u.firstname = auth['info']['first_name']
            u.lastname = auth['info']['last_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(20)
        end
        if user.valid?
            session[:user_id] = user.id
            flash[:message] = "Successful Login!"
            redirect_to shoes_path
        else
        end
        #firstname
        #lastname
        #email
        #password
        #uid
        #provider
        byebug
    end

    def destroy

    end

    private

    def  uid_auth
        request.env['omniauth.auth']
    end

end