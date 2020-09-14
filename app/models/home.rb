class Home < ApplicationRecord
  has_many :users, :chores, :expenses
  belongs_to :user
end
