class Home < ApplicationRecord
  has_many :users
  has_many :chores
  has_many :expenses
end
