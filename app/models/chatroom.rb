class Chatroom < ApplicationRecord
    has_many :messages
    has_many :users, through: :messages
    has_many :chatroom_users

    validates :title, presence: true

    def chatroom_users=(array)
        array.shift
        array.each do |id|
            chat_user = ChatroomUser.create(chatroom_id: self.id, user_id: id)
            self.chatroom_users << chat_user
        end
    end
  
end
