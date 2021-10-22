class AddLikeJob < ApplicationJob
  queue_as :default

  def perform(like_params)
    Like.create(like_params)
  end
end
