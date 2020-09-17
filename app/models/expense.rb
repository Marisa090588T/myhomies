class Expense < ApplicationRecord
  EXPENSES = ["rent", "bills", "household", "other"]
  belongs_to :user
  belongs_to :home
  has_many :expense_shares

  def paid_by?(user)
    expense_shares.find_by(user: user).paid?
  end
end
