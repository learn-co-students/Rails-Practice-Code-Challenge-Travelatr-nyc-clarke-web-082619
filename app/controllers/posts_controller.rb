class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update]

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        render :show
    end

    def edit
        render :edit
    end

    def update
        @post.update(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def increase_likes
        @post = Post.find(params[:id])
        @post.update( likes: @post.likes + 1 )
        redirect_to post_path(@post)
    end

        private
            def post_params
                params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
            end

            def find_post
                @post = Post.find(params[:id])
            end    

end
