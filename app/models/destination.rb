class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    validates :name, presence: true
    validates :country, presence: true


    def name_and_country
        "#{name},  #{country}"
    end

    def five_most_recent_posts
        posts.last(5)
    end

    def most_liked_post
        posts.sort_by{|post| post.likes}.last
    end

    def average_blogger_age
        if bloggers.length > 0 
            uniq_bloggers = bloggers.uniq

            age_total = uniq_bloggers.reduce(0){|sum, blogger| sum + blogger.age}
            return age_total/(uniq_bloggers.length)
        else
            return "N/A"
        end
    end
end
