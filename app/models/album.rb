class Album < ActiveRecord::Base

  belongs_to :artist
  has_many :songs

  validates :title, presence: true
  validates :label, presence: true

  before_validation :ensure_label_has_a_value

  protected

  def ensure_label_has_a_value

  end

end
