class MessagesController < ApplicationController

    def create
        
        @message = Message.new(message_params)
        @message.user_id = session[:user_id]
        if !@message.save
            @message.content = "some content"
            @message.save
        end
        
        ActionCable.server.broadcast 'messages',
            message: Message.parse_latest_messages(@message.chatroom_id),
            user: @user = User.find(@message.user_id).username,
            chatroom_id: @message.chatroom_id
        head :ok

    end

    private 

    def message_params
        params.required(:message).permit(:content, :chatroom_id)
    end

end