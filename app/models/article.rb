class Article < ApplicationRecord
  has_many :versions, class_name: "ArticleVersion"
  accepts_nested_attributes_for :versions

  validates_presence_of :title, :versions

  def latest_version
    versions.order("created_at").last
  end

  def prior_versions
    versions.order("created_at")[0..-2]
  end
end
