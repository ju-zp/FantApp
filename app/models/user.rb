class User < ApplicationRecord
    has_many :characters
    has_many :races, through: :characters
    has_many :messages 
    has_many :chatroom_users
    has_many :chatrooms, through: :chatroom_users
    has_secure_password
    validates :username, presence: true, uniqueness: true
end
