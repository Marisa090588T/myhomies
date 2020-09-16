class Home < ApplicationRecord
  has_many :users
  has_many :chores
  has_many :expenses
  has_secure_token :invite_token

end
