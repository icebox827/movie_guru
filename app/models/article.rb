class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 5..50 }
  validates :text, presence: true, length: { in: 5..350 }
  validates :category_id, presence: true
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes, dependent: :destroy
  scope :ordred_by_votes, -> { order(votes_count: :desc).includes(:category) }
  def votes_count
    votes.count
  end
end
