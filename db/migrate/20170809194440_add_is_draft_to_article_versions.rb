class AddIsDraftToArticleVersions < ActiveRecord::Migration[5.1]
  def change
    add_column :article_versions, :is_draft, :boolean
  end
end
