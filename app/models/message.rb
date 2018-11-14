class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  validates :content, presence: true

  def get_messages_by_chat(id)
    Message.all.select{|m|m.chatroom_id == id}
  end

  def get_latest_messages(id)

  end

end
