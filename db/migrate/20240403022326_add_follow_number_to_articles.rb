class AddFollowNumberToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :follow_number, :integer
  end
end
