class Article < ApplicationRecord
  has_many :versions, class_name: "ArticleVersion"
  accepts_nested_attributes_for :versions

  validates_presence_of :title, :versions
end
