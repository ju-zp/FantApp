class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  validates :content, presence: true

  def self.get_messages_by_chat(id)
    Message.all.select{|m|m.chatroom_id == id}
  end

  def self.get_latest_messages(id)
    all_messages = get_messages_by_chat(id)
    all_messages[all_messages.length-10..all_messages.length]
  end

end
