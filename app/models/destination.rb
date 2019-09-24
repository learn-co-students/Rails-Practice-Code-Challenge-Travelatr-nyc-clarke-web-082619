class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        posts.max{|post| post.likes }
    end

    def featured_post_title
        featured_post.title
    end

    def last_five_posts
        posts.last(5).map{|post| post.title}
    end

    def unique_bloggers_age
        bloggers.uniq.sum{|blogger| blogger.age}
    end

    def unique_bloggers_count
        bloggers.uniq.count
    end

    def bloggers_average_age
        unique_bloggers_age/unique_bloggers_count
    end

        
end
