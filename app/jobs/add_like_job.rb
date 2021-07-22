class AddLikeJob < ApplicationJob
  queue_as :add_like

  def perform(like_params)
    ActiveRecord::Base.transaction do
      @like = Like.new(like_params)
    end
  end
end
