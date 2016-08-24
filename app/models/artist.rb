class Artist < ActiveRecord::Base

  has_many :albums
  has_many :songs, through: :albums

  validates :name, presence: true
  validates :origin, presence: true
end
