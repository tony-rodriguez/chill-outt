class Article < ApplicationRecord
  has_many :article_versions

  validates_presence_of :title
end
