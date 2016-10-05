class Vote < ActiveRecord::Base
  belongs_to :song
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy

  def total_likes
    self.likes.count
  end

  def total_dislikes
    self.dislikes.count
  end

  def total_votes
    total_likes + total_dislikes
  end

  def like_percent
    sum = (total_likes/total_votes) * 100
    sum.round(1).to_s + "%"
  end

  def dislike_percent
    sum = (total_dislikes/total_votes) * 100
    sum.round(1).to_s + "%"
  end
end
