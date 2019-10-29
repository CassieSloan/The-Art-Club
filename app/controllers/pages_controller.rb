class PagesController < ApplicationController

    def welcome
    end

    def home
        render plain: "hello this is welcome"
    end

end