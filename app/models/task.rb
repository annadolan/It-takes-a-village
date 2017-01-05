class Task < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :category
end
