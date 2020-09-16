class Chore < ApplicationRecord
  belongs_to :home
  belongs_to :assignee, class_name: "User", optional: true
end
