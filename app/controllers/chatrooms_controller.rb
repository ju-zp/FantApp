class ChatroomsController < ApplicationController

    before_action :logged_in?

    def new
        @chatroom = Chatroom.new
    end

    def index
        @public = Chatroom.public_rooms
        if session[:user_id]
            @private = Chatroom.private_rooms(session[:user_id])
        else
            @private = nil
        end
        
        @chatrooms = Chatroom.all
    end
    
    def create 
        @chatroom = Chatroom.new(chatroom_params)
 
        if @chatroom.save
            redirect_to @chatroom
        else
            redirect_to new_chatroom_path
        end
    end

    def show
        @chatroom = Chatroom.find(params[:id])
        if !@chatroom.public
            valid_user?(@chatroom)
        end
        @message = Message.new
    end

    def destroy
        
        Chatroom.find(params[:id]).destroy
        redirect_to chatrooms_path
    end

    private 

    def chatroom_params
        params.require(:chatroom).permit(:title, :description, :public, chatroom_user_ids: [])
    end

    def logged_in?
        if session[:user_id]
            true
        else
            redirect_to root_path
        end
    end

    def valid_user?(chatroom)
        ids = chatroom.users.map{|u| u.id}
        if !ids.include?(session[:user_id])
            redirect_to chatrooms_path
        end
    end


end