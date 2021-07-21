class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_path, notice: "You are logged in!"
        else
          if user == nil
            flash[:alert] = "Invalid email.  Please try again."
          else
            flash[:alert] = "Invalid password."
          end
          render :new
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end
end