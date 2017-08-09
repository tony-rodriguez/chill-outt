class CreateArticleVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :article_versions do |t|
      t.string :content, null: false
      t.integer :article_id
      t.integer :author_id

      t.timestamps
    end
  end
end
