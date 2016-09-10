class Artist < ActiveRecord::Base

  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums, dependent: :destroy

  validates :name, presence: true
  validates :origin, presence: true
end
