require "bundler/capistrano"

default_environment["RAILS_ENV"] = "production"
default_environment["PATH"] = "/opt/ruby-enterprise/bin:/usr/local/bin:/usr/bin:/bin:"

role :app, "forum.event.techbang.com.tw"
role :web, "forum.event.techbang.com.tw"
role :db,  "forum.event.techbang.com.tw", :primary => true

set :scm, "git"
set :repository,  "git@github.com:charliechu/ForumCRUD.git"
set :branch, "master"

set :user, "apps"
set :deploy_to, "/home/apps/forum"
set :rake, "/opt/ruby-enterprise/bin/rake"
set :use_sudo, false

namespace :my_tasks do
  desc "Create database.yml and asset packages"
  task :symlink, :roles => [:web] do
    symlink_hash = {
      "#{shared_path}/config/database.yml" => "#{release_path}/config/database.yml"
    }

    symlink_hash.each do |source, target|
      run "ln -sf #{source} #{target}"
    end
  end
end

namespace :deploy do
  task :restart, :roles => [:web], :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


after "deploy:update_code", "my_tasks:symlink"