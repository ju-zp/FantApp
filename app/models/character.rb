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

    def average_rating
        rating = 0
        count = 0
        self.comments.each do |c|
            rating += c.rating
            count += 1
        end
        (rating/count.to_f).round(1)
    end

    def has_rating?
        if self.comments.size == 0
            false
        else
            true
        end
    end

end
