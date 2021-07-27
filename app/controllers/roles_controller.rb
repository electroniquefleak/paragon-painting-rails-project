class RolesController < ApplicationController
    def new
        @role = Role.new
        @project = Project.find(params[:project_id])
    end
end
