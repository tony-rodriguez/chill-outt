class User < ApplicationRecord
  has_many :article_versions, foreign_key: :author_id
  belongs_to :type, class_name: "UserType"

  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  def saved_version_drafts
    article_versions.select {|version| version.is_draft == true}
  end
end
