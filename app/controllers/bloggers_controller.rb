class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
        render :index
    end

    def new
        @blogger = Blogger.new
        render :new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to blogger_path(@blogger)
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    def show
        @blogger = Blogger.find(params[:id])
        @total_likes = @blogger.posts.map {|post| post.likes}.sum
        @most_liked_post = @blogger.posts.sort_by{|post| -post.likes}[0]
        render :show
    end

    private
    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end
end
