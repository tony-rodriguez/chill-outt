class Article < ApplicationRecord
  has_many :versions, class_name: "ArticleVersion"
  accepts_nested_attributes_for :versions

  validates_presence_of :versions

  def latest_version
    versions.order("updated_at").last
  end

  def latest_saved_version
    versions.order("updated_at").select { |version| !version.is_draft }.last
  end

  def first_version
    versions.order("created_at").first
  end

  def prior_versions
    versions.order("updated_at")[0..-2]
  end

  def ordered_saved_versions
    versions.order(created_at: :desc).select {|version| !version.is_draft}
  end

  def self.featured
    self.where(is_featured: true).order(updated_at: :desc)
  end

  def self.search(param, articles = self.all)
    articles.select { |article| article.latest_version.title.downcase.include? param.downcase}
  end

  def self.with_a_saved_version
    self.select { |article| article.latest_saved_version }
  end

  def self.search_saved_versions(param)
    self.search(param, self.with_a_saved_version)
  end
end
