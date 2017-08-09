class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.boolean :is_featured, default: false

      t.timestamps
    end
    add_index :articles, :title
  end
end
