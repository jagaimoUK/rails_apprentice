class CreateTagRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_relations do |t|
    
      t.timestamps
    end
  end
end
