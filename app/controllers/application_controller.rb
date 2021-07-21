class ApplicationController < ActionController::Base
    helper_method :current_user

    private

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def authenticate_admin!
        if !current_user.admin?
            flash[:alert] = "You do not have access to this page. Admin Only."
            redirect_to dashboard_path
        end
    end
end
