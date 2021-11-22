class ApplicationController < ActionController::Base
    include ApplicationHelper       #the entire application now has access to the helper methods located in ApplicationHelper

    private

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?           #logged_in? is defined in helpers/application_helper.rb
    end
end