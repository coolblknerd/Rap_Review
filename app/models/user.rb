class User < ActiveRecord::Base

  enum role: [:member, :admin]

  after_initialize :set_default_role, if: :new_record?

  has_attached_file :avatar, styles: { med: "300x300", thumb: "100x100" }
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def set_default_role
    self.role ||= :member
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
