class ApplicationController < ActionController::Base
    def flash_message
        if flash[:notice] || flash[:alert] 
            content_tag(:div, flash[:notice] || flash[:alert], class: "alert alert-#{flash[:notice] ? 'success' : 'danger'} alert dismissable fade show m-0", role:'alert')
        end   
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end
end
