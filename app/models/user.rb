class User < ApplicationRecord
    has_many :characters
    has_many :races, through: :characters
    has_secure_password
    validates :username, presence: true, uniqueness: true
end
