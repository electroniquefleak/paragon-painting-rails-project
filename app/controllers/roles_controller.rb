class RolesController < ApplicationController
    def new
        @role = Role.new
        @project = Project.find(params[:project_id])
    end

    def create
        @role = Role.new(role_params)
        @role.project_id = params[:project_id]
        if @role.save
            flash[:notice] = 'Teammate Added!'
            redirect_to project_role_path(params[:project_id])
        else
            flash[:alert] = 'Failed to add teammate!'  
            render :new
        end
    end

    def index
        @project = Project.find(params[:project_id])
    end

    def destroy
        role = Role.find(params[:id])
        if role.destroy
            flash[:notice] = "Teammate Removed!"
            redirect_to project_role_path(params[:project_id])
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
end
