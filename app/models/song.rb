class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  validates :title, presence: true
end
