class GenresController < ApplicationController

    def index
        @artworks_all = Content.all #collects all artwork data and stores in instand variable @artworks_all
        @genres_all = Genre.all #collects all genre data and stores in instance variable @genres_all
    end

    def filter
    end
end
