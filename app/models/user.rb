class User < ApplicationRecord
    has_many :characters, dependent: :destroy
    has_many :races, through: :characters
    has_many :messages, dependent: :destroy
    has_many :chatroom_users, dependent: :destroy
    has_many :chatrooms, through: :chatroom_users, dependent: :destroy
    has_secure_password
    validates :username, presence: true, uniqueness: true
end
