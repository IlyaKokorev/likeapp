class AddLikeJob < ApplicationJob
  queue_as :default

  def perform(like_params)
    ActiveRecord::Base.transaction do
      @like = Like.create(like_params)
    end
  end
end
