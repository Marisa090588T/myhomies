class User < ApplicationRecord
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

  def to_label
    "#{first_name}"
  end
end
