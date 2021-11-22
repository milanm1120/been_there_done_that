class ApplicationController < ActionController::Base
    include ApplicationHelper       #the entire application now has access to the helper methods located in ApplicationHelper
end