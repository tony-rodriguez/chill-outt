class ArticleVersion < ApplicationRecord
  belongs_to :article
  belongs_to :author, class_name: "User"

  validates_presence_of :content, :author, :article

end
