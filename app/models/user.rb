class User < ApplicationRecord
    has_many :characters
    has_many :races, through: :characters
    
    validates :username, presence: true, uniqueness: true
end
