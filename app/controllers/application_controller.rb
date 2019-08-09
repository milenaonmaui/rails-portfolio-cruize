class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user, :flash_class, :admin?

    def logged_in?
        current_user
    end

    def admin?
        current_user && current_user.admin == true
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
            flash[:error] = "Please log in first"
            redirect_to login_path
        end
    end

    
    def display_errors(obj)
        flash[:error] = "#{obj.errors.full_messages.join(". ")}"
    end
end
