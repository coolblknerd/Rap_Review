class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs
  has_many :votes, through: :songs do

    # This will count up the total likes amongs all the songs
    def total_likes
      total = 0
      self.each { |vote| total += vote.likes.count }
      total
    end

    def total_dislikes
      total = 0
      self.each { |vote| total += vote.dislikes.count }
      total
    end

    # Tallies the votes
    def total_votes
      total_likes + total_dislikes
    end

    # gives the overall rating percent for album
    def like_percent
      sum = (total_likes/total_votes) * 100
      sum.round(1).to_s + "%"
    end

    def dislike_percent
      sum = (total_likes/total_votes) * 100
      sum.round(1).to_s + "%"
    end

  end

  validates :title, presence: true
  validates :label, presence: true

  after_initialize :ensure_label_has_a_value

  has_attached_file :cover_art, styles: { med: "350x350", thumb: "100x100" }
  validates_attachment_content_type :cover_art, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  private

  # Set only if label IS NOT set
  def ensure_label_has_a_value
    self.label ||= independent
  end

  def independent
    "Independent"
  end

end
