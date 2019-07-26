class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user, :flash_class

    def logged_in?
        current_user
    end

    def current_user
        current_user ||= User.find_by_id(session[:user_id])
    end

    def flash_class(level)
        case level
            when 'notice' then "alert alert-info"
            when 'success' then "alert alert-success"
            when 'error' then "alert alert-danger"
            when 'alert' then "alert alert-warning"
        end
    end


    private

    def require_logged_in
        if !logged_in?
            redirect_to login_path
        end
    end
end
