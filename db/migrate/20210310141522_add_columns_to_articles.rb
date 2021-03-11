class AddColumnsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :title, :string
    add_column :articles, :text, :text
    add_column :articles, :author_id, :integer
    add_index :articles, :author_id
    add_column :articles, :category_id, :integer
    add_index :articles, :category_id
  end
end
