set :user, 'hanes'
set :domain, '37.157.198.135'

 set :scm, :git

#set :repository, "gitolite@37.157.198.135:farnost"
#set :repository, "file:/home/gitolite/repositories/farnost.git"
set :rails_env, "production"
set :application, "svatba"
set :repository, "gitbox:svatba"
set :deploy_to, "/u/apps/#{application}"
set :deploy_via, :remote_cache
set :keep_releases, 5
set :rails_env, "production"
set :copy_cache, true
set :user, "root"
set :use_sudo, false

set :scm, :git # Should I change this to :none
set :branch, "master"

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

task :after_symlink do
  run "ln -nfs #{shared_path}/images/uploads #{release_path}/public/images/uploads"
end

namespace :assets do
  desc "Compile assets"
  task :precompile, :roles => :app do
    run "cd #{release_path} && rake RAILS_ENV=#{rails_env} assets:precompile"
  end
end

after "deploy:symlink" do
  run "chmod -R 0666 #{current_path}/log"
  run "chown -R www-data:www-data #{current_path}/"
end



# If you are using Passenger mod_rails uncomment this: