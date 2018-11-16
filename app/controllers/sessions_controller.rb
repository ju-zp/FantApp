class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:username].downcase)
        params[:username] = params[:username].strip.downcase
        if @user == nil
            @user = User.new(user_params)
            if !@user.save
                redirect_to '/you-shall-not-pass'
                return
            end
        end
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/profile'
        else
            redirect_to '/you-shall-not-pass'
        end
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