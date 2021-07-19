class LikesController < ApplicationController
  before_action :set_like, only: [:show, :destroy]

  # GET /likes
  def index
    @likes = Like.all

    render json: @likes
  end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    cd 

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
  end

  private
  def set_like
    @like = Like.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
