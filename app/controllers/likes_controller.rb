class LikesController < ApplicationController
  before_action :set_like, only: %i[show destroy]
  before_action :set_counter, only: :index

  # GET /likes
  def index
    @likes = Like.all

    CounterStatJob.perform_later(@counter)

    render json: @likes
  end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    AddLikeJob.perform_later(like_params)
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def set_counter
    @counter = Counter&.first
  end

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
