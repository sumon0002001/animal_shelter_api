class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :destroy]

  # GET /favourites
  def index
    @favourites = Favourite.all

    render json: @favourites
  end

  # GET /favourites/1
  def show
    render json: @favourite
  end

  # POST /favourites
  def create
    @favourite = Favourite.create(favourite_params)
    render json: @favourite
  end

  def destroy
    @favourite.destroy
  end

  private
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end
      def favourite_params
      params.require(:favourite).permit(:user_id, :cat_id)
    end
end
