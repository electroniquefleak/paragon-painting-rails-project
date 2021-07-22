class ProjectsController < ApplicationController
    before_action :authenticate_admin!, except: :show
    before_action :set_project, except: [:new, :create]

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

    def edit 
    end

    def update
        if @project.update(project_params)
          flash[:notice]= "Project updated"
          redirect_to dashboard_path
        else
          flash[:alert]= "Project update was unsuccessful."
          render :edit
        end
    end

    def destroy
        @project.destroy
        redirect_to dashboard_path, notice: "Successful Project Deletion."
    end

    def show 
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
