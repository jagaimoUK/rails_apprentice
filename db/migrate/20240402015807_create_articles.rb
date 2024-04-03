class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :name
      t.text :body
      t.string :tags

      t.timestamps
    end
  end
end
