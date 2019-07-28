class UsersController < ApplicationController

    def new
        @user=User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to cruises_path
        else
            display_errors(@user)
            render :new
        end

    end

    def show
        if logged_in? && params[:id].to_i == current_user.id
            @user = User.find_by_id(params[:id])
        else
          flash[:error] = "You are not allowed to view this page"
          redirect_to '/'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
