class Song < ActiveRecord::Base

  has_one :vote, dependent: :destroy
  belongs_to :album
  belongs_to :artist

  validates :title, presence: true

  after_save :make_voteable

  private

  def make_voteable
    Vote.create(song_id: self.id)
  end
end
