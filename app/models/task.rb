class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :category

  enum importance: { low: 0, middle: 1, high: 2 }
  def self.ransackable_attributes(auth_object = nil)
    ["title", "category_id", "deadline_on", "importance"]
  end
end