namespace :dev do
  
  desc "Rebuild System"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]
  
  desc "Each board should show its posts count"
  task :reset_post_counter => :environment do
    #Board.reset_column_information
    @boards = Board.all
    @boards.each do |board|
      Board.reset_counters board.id, :posts
      puts "#{board.name}, OK"
    end
  end  
end