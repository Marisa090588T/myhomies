class Chatroom < ApplicationRecord
  has_many :messages, -> { order(created_at: :desc) }
  belongs_to :home
end
