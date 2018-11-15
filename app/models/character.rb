class Character < ApplicationRecord
    belongs_to :user
    belongs_to :race
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
    validates :name, presence: true

    def to_slug
        name.downcase.parameterize
    end

    def to_param
        slug
    end

end
