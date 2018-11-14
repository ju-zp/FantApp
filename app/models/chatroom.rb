class Chatroom < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :chatroom_users, dependent: :destroy
    has_many :users, through: :chatroom_users
    before_destroy :destroy_users

    validates :title, presence: true

    def chatroom_user_ids=(array)
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

    def self.public_rooms
        Chatroom.all.select{|c| c.public == true}
    end

    def self.private_rooms(user_id)
        Chatroom.all.select{|c| c.user_ids.include?(user_id)}.select{|c| c.public == false}
    end

    private

    def destroy_users
        self.users.destroy_all
    end
  
end
