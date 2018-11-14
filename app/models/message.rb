class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  validates :content, presence: true

  def self.get_messages_by_chat(id)
    Message.all.select{|m|m.chatroom_id == id}
  end

  def self.get_latest_messages(id)
    all_messages = get_messages_by_chat(id)
    if all_messages.length >= 10
      all_messages[all_messages.length-10..all_messages.length]
    else
      all_messages
    end
  end

  def self.parse_latest_messages(id)
    hash = {}
    count = 0
    hash[:size] = get_latest_messages(id).length 
    get_latest_messages(id).each do |m|
      hash[count] = {
        :name => User.find(m.user_id).username,
        :content => m.content.gsub("\n", "")
      }
      count+=1
    end
    hash
  end

end
