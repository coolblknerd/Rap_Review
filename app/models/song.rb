class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  validate :title
  validate :artist
end
