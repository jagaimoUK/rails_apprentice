class CreateTagRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_relationships do |t|
      t.references :article, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false
      t.timestamps
    end
  end
end
