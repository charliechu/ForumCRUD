class AddPostsCount < ActiveRecord::Migration
  def self.up
    add_column :boards, :posts_count, :integer, :default => 0
    
    #each board should show its posts count!
    Board.reset_column_information
    Board.find_each do |b|
      Board.reset_counters b.id, :posts
    end
  end

  def self.down
    remove_column :boards, :posts_count
  end
end
