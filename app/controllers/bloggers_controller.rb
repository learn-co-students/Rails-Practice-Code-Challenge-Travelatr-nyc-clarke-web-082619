class BloggersController < ApplicationController
    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blogger_params)
        redirect_to @blogger
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end