class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @most_recent_posts = @destination.posts.sort_by{|post| post.created_at}.last(5)
        @featured_post = @destination.posts.max_by{|post| post.likes}
        @average_age = @destination.bloggers.map{|blogger| blogger.age}.sum/(@destination.bloggers.length.to_f)
    end
end