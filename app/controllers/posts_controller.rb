class PostsController < ApplicationController

    def index 
        @posts = Post.all
        render :index
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
        render :new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)    
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def increment_likes
        @post = Post.find(params[:id])
        @post.increment!(:likes, by = 1).save
        redirect_to post_path(@post)
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :destination_id, :blogger_id)
    end
end
