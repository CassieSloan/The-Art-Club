class PagesController < ApplicationController

    def welcome
    end

    def home
    end

    def explore

    end

    def results_all
        @artworks_all = Content.all
    end

    def show
    end

    def payment_success
    end

    def contact
    end

    def sell
    end

    def create
    end

    def profile
    end

    def profile_edit
    end

    # def artwork_params
    #     params.require(:listing).permit(:title, :price, :genre, :medium)
    # end





end