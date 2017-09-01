class User < ApplicationRecord
  has_many :article_versions, foreign_key: :author_id
  belongs_to :type, class_name: "UserType"
  has_many :contributed_articles, through: :article_versions, source: :article
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  def saved_version_drafts
    article_versions.select { |version| version.is_draft == true }
  end

  def articles_originally_created
    article_versions.select { |version| version.article.first_version.author == self }
  end

  def promote_to_admin_if_ready
    if type.name.downcase != "admin" && articles_originally_created.count >= 10
      self.type = UserType.find_or_create_by(name: "admin")
      self.save
    end
  end

  def is_admin?
    type.name.downcase == "admin"
  end
end
