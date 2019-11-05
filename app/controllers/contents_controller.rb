class ContentsController < ApplicationController

    before_action :authenticate_user!

    def new
        @artwork = Content.new
        @genres = Genre.all
        @mediums = Medium.all
    end

    def create

        @artwork = current_user.contents.create(content_params)
        
        if @artwork.errors.any?
            @genres = Genre.all
            @mediums = Medium.all 
            render "new"
        else 
            redirect_to artwork_path(params[:id])
        end
    end

    def edit
        @genres = Genre.all
        @mediums = Medium.all    
    end

    def update        
        if @content.update(content_params)
            redirect_to artwork_path(params[:id])
        else
            @genres = Genre.all
            @mediums = Medium.all             
            render "edit"
        end
    end

    def delete
    end

    def content_params
        params.require(:content).permit(:title, :price, :genre, :medium, :pic[])
    end

end