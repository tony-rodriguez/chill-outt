class User < ApplicationRecord
  has_many :article_versions
  belongs_to :type, class_name: "UserType"

  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username
end
