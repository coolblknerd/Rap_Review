class Artist < ActiveRecord::Base

  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums, dependent: :destroy

  validates :name, presence: true
  validates :origin, presence: true

  has_attached_file :profile_img, styles: { med: "350x350", thumb: "100x100" }
  validates_attachment_content_type :profile_img, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
