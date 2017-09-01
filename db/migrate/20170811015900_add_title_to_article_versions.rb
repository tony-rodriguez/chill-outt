class AddTitleToArticleVersions < ActiveRecord::Migration[5.1]
  def change
    add_column :article_versions, :title, :string
  end
end
