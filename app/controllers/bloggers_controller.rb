class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show, :edit, :update, :destroy]

    def index
        @bloggers = Blogger.all
    end
    
    def new
        @blogger = Blogger.new
    end

    def show
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger)
        else
            redirect_to new_blogger_path
        end
    end

    def edit
    end

    def update
        @test_blogger = Blogger.new(blogger_params)
        if @test_blogger.valid?
            @blogger.update(blogger_params)
        end
        redirect_to blogger_path(@blogger)
    end

    def destroy
        @blogger.destroy
    end

    private

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio, :created_at, :updated_at)
    end
end
