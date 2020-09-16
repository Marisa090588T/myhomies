class Expense < ApplicationRecord
  EXPENSES = ["rent", "bills", "household", "other"]
  belongs_to :user
  belongs_to :home
  has_many :expense_shares
end
