class LikesController < ApplicationController
  before_action :set_like, only: %i[show destroy]
  before_action :set_counter, only: :index

  # GET /likes
  def index
    @likes = Like.all
    @counter.with_lock { CounterStatJob.perform_later(@counter) }
    render json: @likes.count
  end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    AddLikeJob.perform_later(like_param)
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def set_counter
    @counter = Counter&.first
    Counter.create!(id: 1, count: 0) unless @counter
  end

  def like_param
    params.require(:like).permit(:user_id, :post_id)
  end
end
