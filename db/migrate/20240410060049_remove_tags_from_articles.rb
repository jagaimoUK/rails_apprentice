class RemoveTagsFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :tags
  end
end