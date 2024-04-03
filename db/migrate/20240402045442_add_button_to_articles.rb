class AddButtonToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :button, :integer
  end
end
