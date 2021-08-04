class CatsController < ApplicationController
  before_action :set_cat, only: [:show]

  # GET /cats
  def index
    @cats = Cat.all

    render json: @cats
  end

  # GET /cats/1
  def show
    @cat = Cat.find(params[:id])
    render json: @cat
  end

  # POST /cats
  def create
    @cat = Cat.create!(cat_params)
    render json: @cat
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end
    
    def cat_params
      params.permit(:pet_name, :pet_color, :age)
    end
end
