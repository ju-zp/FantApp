class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username].downcase)
        if @user == nil
            @user = User.new(user_params)
            if !@user.save
                redirect_to '/'
            end
        end
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/profile'
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end


    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

end