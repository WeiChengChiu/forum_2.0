class Comment < ApplicationRecord
  validates :name, presence: true

  belongs_to :topic
end
