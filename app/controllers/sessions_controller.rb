class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def destroy
        session.clear
        redirect_to login_path
    end
end