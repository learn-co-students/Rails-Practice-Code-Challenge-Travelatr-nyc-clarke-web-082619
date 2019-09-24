class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts

    validates :name, presence: true
    validates :bio, presence: true
    validates :age, presence: true
    validates :name, uniqueness: true
    validates :bio, length: { minimum: 30 }

    def featured_post
        posts.max {|post| post.likes }
    end

    def featured_post_title
        featured_post.title
    end

    def top_five_destinations
        self.destinations.max(5){|d| d.posts.count }.map {|d| d.name}
    end

end
