class ContentsController < ApplicationController

    before_action :set_user_content, only: [:edit, :update, :delete]
    before_action :authenticate_user!, #only: [:new, :create. :edit, :update, :destroy]


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
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                name: @content.name,
                description:@content.description,
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
        @artwork = Content.new
        @genres = Genre.all
        @mediums = Medium.all
    end

    def create

        @artwork = Content.new(content_params)
        @artwork.user_id = current_user.id
        
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

    def destroy
        
    end

    def set_user_content
        @content =  current_user.content.find_by_id(:params[:id])

        if @content == nil
            redirect_to results_all_path
        end
    end

    def content_params
        params.require(:content).permit(:title, :price, :genre, :medium, :pic[])
    end

end