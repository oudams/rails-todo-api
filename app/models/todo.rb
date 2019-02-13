class Todo < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :title, :owner, presence: true
end
