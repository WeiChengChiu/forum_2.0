class Topic < ApplicationRecord
  validates :name, presence: true

  has_many :comments, :dependent => :destroy
end
