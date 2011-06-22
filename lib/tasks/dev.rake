namespace :dev do
  
  desc "Rebuild System"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]
  
  desc "Fake Data"
  task :fake => :environment do
      [Board, Post, Category, User].each(&:delete_all)
      
      Category.populate(10) do |category|
        category.name = Populator.words(1..5).titleize
      end
      
      Board.populate(10) do |board|
        board.name = Populator.words(1..5).titleize
        board.created_at = 2.years.ago..Time.now
      end
      
      10.times.each do
        user = User.create!(:email => Faker::Internet.email, :password => "123456")
        Post.populate (1..5) do |post|
          board_ids = Board.select(:id)
          board_range = board_ids.size
          random_board_id = board_ids[rand(board_range)]
          post.board_id = random_board_id
          post.subject = Populator.words(1..5).titleize
          post.content = Populator.sentences(2..10)
          post.created_at = 1.years.ago..Time.now
          post.user_id = user.id
        end
      end
      
      #category_ids = Category.select(:id)
      #category_range = category_ids.size
      #post_ids = Post.select(:id)
      #post_range = post_ids.size
      #categoryPostRelation_max_number = 3*post_range
      #CategoryPostRelation.populate(0..categoryPostRelation_max_number) do |categorypostrelation|
      #  random_category_ids = category_ids[rand(category_range)]
      #  categorypostrelation.post_id = random_category_ids
      #  random_post_ids = post_ids[rand(post_range)]
      #  categorypostrelation.post_id = random_post_ids
      #end
  end  
end