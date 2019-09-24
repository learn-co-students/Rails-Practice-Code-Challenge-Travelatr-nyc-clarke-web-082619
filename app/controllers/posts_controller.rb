class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy, :like]

    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def show
    end

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            redirect_to new_post_path
        end
    end

    def edit
    end

    def update
        @test_post = Post.new(post_params)
        if @test_post.valid?
            @post.update(post_params)
        end
        redirect_to post_path(@post)  
      end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    def like
        @new_likes = @post.likes + 1
        @post.update(likes: @new_likes)
        redirect_to post_path(@post)
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id, :created_at, :updated_at)
    end
end
