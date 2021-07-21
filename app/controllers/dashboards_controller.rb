class DashboardsController < ApplicationController
  before_action :require_login
  
  def dashboard
  end

  private

  def require_login
    unless current_user
    flash[:alert] = "You must be logged in to access this section."
    redirect_to login_path
    end
  end
end
