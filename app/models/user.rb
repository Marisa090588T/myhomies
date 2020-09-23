class User < ApplicationRecord
  include CloudinaryHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  belongs_to :home, optional: true
  has_many :chores, foreign_key: "assignee_id"
  has_many :expense_shares
  has_many :expenses, through: :expense_shares
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :photo

  def to_label
    "#{cl_image_tag self.photo.key, height: 80, width: 80, crop: :fill} #{first_name}".html_safe
  end
end
