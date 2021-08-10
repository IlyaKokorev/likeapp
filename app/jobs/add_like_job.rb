class AddLikeJob < ApplicationJob
  queue_as :default

  def perform(like_params)
    ActiveRecord::Base.transaction do
      Like.create(like_params)
    end
  end
end
