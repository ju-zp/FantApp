class ChatroomsController < ApplicationController

    before_action :logged_in?
    before_action :get_chatroom, only: [:show, :destroy]

    def new
        @chatroom = Chatroom.new
        @user_races = User.find(session[:user_id]).get_races.uniq
    end

    def index
        @public = Chatroom.public_rooms
        if session[:user_id]
            @private = Chatroom.private_rooms(session[:user_id])
            @races = Chatroom.race_rooms(session[:user_id])
            #raise
        else
            @private = nil
        end
        
        @chatrooms = Chatroom.all
    end
    
    def create 
        @chatroom = Chatroom.new(chatroom_params)
        @chatroom.slug = @chatroom.to_slug
        if @chatroom.save
            redirect_to @chatroom
        else
            redirect_to new_chatroom_path
        end
    end

    def show
        if !@chatroom.public
            valid_user?(@chatroom)
        end
        @message = Message.new
        @latest_messages = Message.parse_latest_messages(@chatroom.id)
    end

    def destroy
        @chatroom.destroy
        redirect_to chatrooms_path
    end

    private 

    def chatroom_params
        params.require(:chatroom).permit(:title, :description, :public, :race, chatroom_user_ids: [])
    end

    def valid_user?(chatroom)
        ids = chatroom.users.map{|u| u.id}
        if !ids.include?(session[:user_id])
            redirect_to chatrooms_path
        end
    end

    def get_chatroom
        @chatroom = Chatroom.find_by_slug(params[:slug])
    end


end