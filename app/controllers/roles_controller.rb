class RolesController < ApplicationController
    before_action :set_project, only: [:new, :index]

    def new
        @role = Role.new
    end

    def create
        @role = Role.new(role_params)
        @role.project_id = params[:project_id]
        if @role.save
            flash[:notice] = 'Teammate Added!'
            redirect_to project_roles_path(params[:project_id])
        else
            flash[:alert] = 'Failed to add teammate!'  
            render :new
        end
    end

    def index
    end

    def destroy
        role = Role.find(params[:id])
        if role.destroy
            flash[:notice] = "Teammate Removed!"
            redirect_to project_roles_path(params[:project_id])
        else
            flash[:alert] = "Teammate was not removed successfully. Try again."
            render :index
        end
    end

    private

    def role_params
        params.require(:role).permit(
            :title,
            :user_id
          )
    end

    def set_project
        @project = Project.find(params[:project_id])
    end
end
