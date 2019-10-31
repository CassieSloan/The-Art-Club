class Medium < ApplicationRecord
    def index
        @artworks_all = Content.all #collects all artwork data and stores in instand variable @artworks_all
        @mediums_all = Medium.all #collects all medium data and stores in instand variable @mediums_all
    end
end
