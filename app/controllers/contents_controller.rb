class ContentsController < ApplicationController

    def new
        @artwork = Content.new
        @genres = Genre.all
        @mediums = Medium.all
    end

    def create
        @artwork = current_user.contents.create(content_params)
        
        if @artwork.errors.any?
            render "new"
        else 
            redirect_to results_all_path
        end
    end

    def edit
    end

    def delete
    end

    def content_params
        params.require(:content).permit(:title, :price, :genre, :medium, :pic[])
    end

end