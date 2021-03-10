class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 5..50 }
  validates :text, presence: true, length: { in: 5..350 }
  validates :category_id, presence: true
  validates :image, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_one_attached :image

  scope :ordred_by_votes, -> { order(votes_count: :desc).includes(:category) }
  scope :with_attached_image, -> { includes(image_attachment: :blob) }
  scope :with_image_category, -> { includes(image_attachment: :blob).includes(:category) }

  def votes_count
    votes.count
  end
end
