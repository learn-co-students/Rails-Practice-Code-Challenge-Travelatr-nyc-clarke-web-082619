class Blogger < ApplicationRecord
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}

    has_many :posts
    has_many :destinations, through: :posts

    def total_post_likes
        posts.reduce(0){|sum, post| sum + post.likes}
    end
    
    def most_liked_post
        posts.sort_by{|post| post.likes}.last
    end
end
