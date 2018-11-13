class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
        @message.user_id = session[:user_id]
        if !@message.save
            @message.content = "some content"
            @message.save
        end
        ActionCable.server.broadcast 'messages',
            message: @message.content,
            user: @user = User.find(@message.user_id)
        head :ok

    end

    private 

    def message_params
        params.required(:message).permit(:content, :chatroom_id)
    end

end