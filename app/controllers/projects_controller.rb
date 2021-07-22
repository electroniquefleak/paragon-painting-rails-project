class ProjectsController < ApplicationController
    def new
        @project = Project.new
    end

    def create
        @project = Project.new
        if @project.save
          flash[:notice] = "Your project has been created."
          redirect_to dashboard_path
        else 
          render :new
        end
    end
end
