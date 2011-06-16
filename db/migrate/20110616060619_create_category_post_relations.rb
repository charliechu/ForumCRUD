class CreateCategoryPostRelations < ActiveRecord::Migration
  def self.up
    create_table :category_post_relations do |t|
      t.integer :category_id
      t.integer :post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_post_relations
  end
end
