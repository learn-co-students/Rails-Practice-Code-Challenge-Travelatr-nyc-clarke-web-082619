class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
        render :index
    end

    def show
        @destination = Destination.find(params[:id])
        @most_liked_post = @destination.posts.sort_by{|post| -post.likes}[0]
        @recent_posts = @destination.posts.sort_by{|post| post.updated_at }[0..4]
        @total_age = @destination.bloggers.map {|blogger| blogger.age }
        if @total_age.length != 0
            @average_age = @total_age.sum / @total_age.length
        else
            @average_age = 0
        end
        render :show
    end
end
