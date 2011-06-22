namespace :dev do
  
  desc "Rebuild System"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]
  
  desc "Fake Data"
  task :fake => :environment do
      require 'populator'
      require 'faker'
      [Board, Post, User].each(&:delete_all)
      
      #User.populate 10 do |user|
      #  user.email = Faker::Internet.email
      #  user.password = "123456"
      #end
      
      Board.populate (10) do |board|
        board.name = Populator.words(1..5).titleize
        board.created_at = 2.years.ago..Time.now
      end
      
      User.populate (10) do |user|
        user = User.create!(:email => Faker::Internet.email, :password => "123456")
        Post.populate (1..5) do |post|
          random_board_id = rand(10)
          post.board_id = random_board_id
          post.subject = Populator.words(1..5).titleize
          post.content = Populator.sentences(2..10)
          post.created_at = 1.years.ago..Time.now
          post.user_id = user.id
        end
      end
  end  
  
  desc "Each board should show its posts count"
  task :reset_post_counter => :environment do
      #Board.reset_column_information
      @boards = Board.all
      @boards.each do |board|
      Board.reset_counters board.id, :posts
      puts "#{board.name}, OK"
    end
  end  
  
  desc "Turn Off Alarm"
  task :turn_off_alarm do
    puts "Turned off alarm. Would have liked 5 more minutes, though."
  end
  
  desc "Groom myself"
  task :groom_myself do
    puts "Brushed teeth."
    puts "Showered."
    puts "Shaved."
  end
  
  desc "make_coffee" 
  task :make_coffee do
    cups = ENV["COFFEE_CUPS"] || 2
    puts "Made #{cups} cups of coffee. Shakes are gone."
  end
  
  desc "Walk Dog"
  task :"walk_dog" do
    puts "Dog walked."
  end
  
  task :ready_for_the_day => [:turn_off_alarm, :groom_myself, :make_coffee, :walk_dog] do
     puts "Ready for the day!"
  end
end