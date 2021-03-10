class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { in: 3..20 }
  validates :priority, presence: true, numericality: { only_integer: true, greater_than: 0 }

  has_many :articles, -> { order(created_at: :desc) }

  scope :priority_sorted, -> { order(priority: :asc) }
  scope :importants, -> { priority_sorted.limit(4) }
  scope :important_with_articles, -> { importants.includes(articles: [image_attachment: :blob]) }

  def latest_article
    articles.first
  end
end
