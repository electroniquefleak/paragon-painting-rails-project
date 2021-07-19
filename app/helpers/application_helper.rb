module ApplicationHelper
    def flash_message
        if flash[:notice] || flash[:alert] 
            content_tag(:div, flash[:notice] || flash[:alert], class: "alert alert-#{flash[:notice] ? 'success' : 'danger'} alert dismissable fade show m-0", role:'alert')
        end   
    end
end
