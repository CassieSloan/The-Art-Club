class ArtistsController < ApplicationController

    def index
        @artworks_all = Content.all #collects all artwork data and stores in instand variable @artworks_all
        @artists_all = User.all #collects all artist data and stores in instance variable @artist_all
        @artist = User.find_by_id(params[:id])
    end

    def show
        @artist = User.find_by_id(params[:id])
        @content = Content.find_by_id(params[:id])
        @artist_content = @artist.contents
    end

end