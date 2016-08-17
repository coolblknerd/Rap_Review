class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs

  validates :title, presence: true
  validates :label, presence: true

  after_initialize :ensure_label_has_a_value

  private

  # Set only if label IS NOT set
  def ensure_label_has_a_value
    self.label ||= independent
  end

  def independent
    "Independent"
  end

end
