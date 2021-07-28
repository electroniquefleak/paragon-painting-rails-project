class DashboardsController < ApplicationController
  before_action :require_login

  def dashboard
    if current_user.admin?
      @projects = Project.all
      @active_projects = Project.active
      @future_projects = Project.future
      @past_projects = Project.past
    else
      @projects = current_user.projects
    end
  end

  private

  def require_login
    unless current_user
    flash[:alert] = "You must be logged in to access this section."
    redirect_to login_path
    end
  end
end
