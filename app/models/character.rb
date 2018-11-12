class Character < ApplicationRecord
    belongs_to :user
    belongs_to :race
    validates :name, presence: true
end
