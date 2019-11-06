class PagesController < ApplicationController

    def welcome
    end

    def home
    end

    def explore
    end

    def results_all
        # @artworks_all = Content.all #collects all artwork data and stores in instand variable @artworks_all
        search = params[:search]
        
        if search
            @artworks_all = Content.where("lower(title) LIKE ?", "%#{search.downcase}%")

        else 
            @artworks_all = Content.all
        end
        
    end

    def payment_success
    end

    def contact
    end

    def profile
    end

    def profile_edit
    end

    # def artwork_params
    #     params.require(:listing).permit(:title, :price, :genre, :medium)
    # end

end