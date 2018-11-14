class Chatroom < ApplicationRecord
    has_many :messages
    has_many :chatroom_users
    has_many :users, through: :chatroom_users

    validates :title, presence: true

    def chatroom_users=(array)
        if self.public
            User.all.each do |u|
                chat_user = ChatroomUser.create(chatroom_id: self.id, user_id: u.id)
                self.chatroom_users << chat_user
            end
        else
            array.shift
            array.each do |id|
                chat_user = ChatroomUser.create(chatroom_id: self.id, user_id: id)
                self.chatroom_users << chat_user
            end
        end
    end

    def self.public
        Chatroom.all.select{|c| c.public == true}
    end

    def self.private(user_id)
        Chatroom.all.select{|c| c.user_ids.include?(user_id)}.select{|c| c.public == false}
    end
  
end
