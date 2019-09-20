class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :show, :update, :like]
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def edit
    end

    def create
        para = post_params
        para[:likes] = 0
        @post = Post.create(para)
        redirect_to @post
    end

    def update
        @post.update(post_params)
        redirect_to @post
    end

    def show
        @blogger = Blogger.find(@post.blogger_id)
        @destination = Destination.find(@post.destination_id)
    end

    def like
        @post.likes += 1
        @post.save
        @post.reload
        redirect_to @post
    end

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
end