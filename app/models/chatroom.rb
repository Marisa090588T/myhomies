class Chatroom < ApplicationRecord
  has_many :messages, -> { order(created_at: :asc) }
  belongs_to :home
end
