class Post < ApplicationRecord
  has_many :likes

  def like(user)
    likes << Like.new(user: user)
  end

  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end
end
