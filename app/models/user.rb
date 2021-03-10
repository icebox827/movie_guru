class User < ApplicationRecord
  class User < ApplicationRecord
    validates :name, uniqueness: { case_sensitive: false }, length: { in: 3..20 }
    before_save { name.downcase! }

    has_many :articles, foreign_key: :author_id, class_name: 'Article'
    has_many :votes, dependent: :destroy
    has_many :liked_articles, through: :votes, source: :article
  end
end
