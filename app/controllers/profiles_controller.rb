class ProfilesController < ApplicationController
    before_action :set_user_content, only: [:edit, :update, :delete]
    before_action :authenticate_user!, only: [:edit, :update, :destroy]


    def index
        @content = Content.all
        # @user_content =  current_user.contents
    end

    def edit

    end

    def update

    end

    def destory
    end

    def set_user_content
        @content =  current_user.contents.find_by_id(params[:id])
    end
end