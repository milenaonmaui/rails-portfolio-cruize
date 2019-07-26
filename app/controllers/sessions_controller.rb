class SessionsController < ApplicationController

    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(:email => params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id]=@user.id
            redirect_to cruises_path
        else
            flash[:error] = "Invalid email or password"
            redirect_to login_path
        end
    end

    def welcome
    end

    def destroy
        session.clear
        redirect_to '/'
    end
end