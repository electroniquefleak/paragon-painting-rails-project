class RolesController < ApplicationController
    before_action :set_project, only: [:new, :index, :edit]
    before_action :set_role, only: [:edit, :update, :destroy]
    before_action :authenticate_admin!, except: :index

    def new
        @role = Role.new
    end

    def create
        @role = Role.new(role_params)
        @role.project_id = params[:project_id]
        if @role.save
            flash[:notice] = 'Your teammate has been added.'
            redirect_to project_roles_path(params[:project_id])
        else
            flash[:alert] = 'Teammate creation was unsuccessful'  
            render :new
        end
    end

    def index
    end

    def edit
    end

    def update
        if @role.update(title: params[:role][:title])
            flash[:notice] = "Your role title has been updated."
            redirect_to project_roles_path(params[:project_id])
        else
            flash[:alert] = "Title update was unsuccessful"
            render :edit
        end
    end

    def destroy
        if @role.destroy
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

    def set_role
        @role = Role.find(params[:id])
    end
end
