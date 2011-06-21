class AddPostsCount < ActiveRecord::Migration
  def self.up
    add_column :boards, :posts_count, :integer, :default => 0
    
    Board.reset_column_information
    Board.find(:all).each do |b|
      b.update_attribute :posts_count, b.posts.length
    end
  end

  def self.down
    remove_column :boards, :posts_count
  end
end
