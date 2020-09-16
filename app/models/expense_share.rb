class ExpenseShare < ApplicationRecord
  belongs_to :expense
  belongs_to :user
  validates :paid, inclusion: { in: [ true, false ] }
end
