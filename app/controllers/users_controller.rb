class UsersController < ApplicationController
    before_action :set_user, only: [:show]
  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def create
    @user = User.create!(user_params)
    render json: @user
  end
  def set_user
    @user = User.find(params[:id])
  end
    def user_params
      params.permit(:username)
    end
end
