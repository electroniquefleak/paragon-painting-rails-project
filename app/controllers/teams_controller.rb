class TeamsController < ApplicationController
    def new
        @team = Team.new
        @project = Project.find(params[:project_id])
    end
end
