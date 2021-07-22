class ProjectsController < ApplicationController
    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
          flash[:notice] = "Your project has been created."
          redirect_to dashboard_path
        else 
          render :new
        end
    end

    private

    def set_project
        @project = Project.find(params[:id])
      end

    def project_params
        params.require(:project).permit(
            :name,
            :location,
            :start_date,
            :end_date,
            :description,
            :revenue_estimate, 
            :cost_estimate,
            user_ids: []
          )
    end
end
