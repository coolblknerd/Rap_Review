class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs

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
