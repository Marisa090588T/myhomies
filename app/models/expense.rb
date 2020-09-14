class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :home
  has_many :expense_shares
end
