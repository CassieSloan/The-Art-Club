class PagesController < ApplicationController

    def welcome
    end

    def home
    end

    def explore

    end

    def results_all
        genre = Genre.title
        artist = User.name
        medium = Medium.material
        price = Content.price
        artwork = Content.title
    end
end