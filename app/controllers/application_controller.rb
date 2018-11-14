class ApplicationController < ActionController::Base
    helper_method :logged_in?

    private

    def logged_in?
        if session[:user_id]
            true
        else
            redirect_to root_path
        end
    end

end
