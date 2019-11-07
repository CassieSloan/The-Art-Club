class ContentsController < ApplicationController

    before_action :set_user_content, only: [:edit, :update, :delete]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        # @artworks_all = Content.all #collects all artwork data and stores in instand variable @artworks_all
        search = params[:search]
        
        if search
            @artworks_all = Content.where("lower(title) LIKE ?", "%#{search.downcase}%")

        else 
            @artworks_all = Content.all
        end
    end
    
    def show
        @content = Content.find_by_id(params[:id])

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                name: @content.title,
                amount: @content.price,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    content_id: @content.id
                }
            },
            success_url: root_url + "orders/success",
            cancel_url: root_url + "results_all",
        )

    @session_id = session.id
    end

    def new
        @content = Content.new
        @genres = Genre.all
        @mediums = Medium.all
    end

    def create

        @artwork = Content.new(content_params)
        @artwork.user_id = current_user.id
        
        if @artwork.save
            redirect_to content_path(@artwork)
        else 
            @content = Content.new
            @genres = Genre.all
            @mediums = Medium.all 
            render "new"
        end
    end

    def edit
        @genres = Genre.all
        @mediums = Medium.all  
        # @content = Content.update(content_params)
    end

    def update        
        if @content.update(content_params)
            redirect_to content_path(params[:id])
        else
            @genres = Genre.all
            @mediums = Medium.all             
            render "edit"
        end
    end

    def destroy
        @content.destroy
    end

    def set_user_content
        @content =  current_user.contents.find_by_id(params[:id])

        if @content == nil
            redirect_to results_all_path
        end
    end

    def content_params
        params.require(:content).permit(:title, :price, :pic, genre_ids:[], medium_ids:[])
    end

    def translate_params
        params[:content][:price] = (params[:content][:price].to_f * 100).to_i
    end

end