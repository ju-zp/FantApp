class ChatroomsController < ApplicationController

    def new
        @chatroom = Chatroom.new
    end

    def index
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
        @message = Message.new
        #@previous_messages = @chatroom.messages.reverse_order.limit(10)
        #@previous_messages = @previous_messages.reverse_order
    end

    private 

    def chatroom_params
        params.require(:chatroom).permit(:title, :description, :public, chatroom_users: [])
    end

end