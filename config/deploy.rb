set :user, 'root'
set :domain, '37.157.198.135'

 set :scm, :git

#set :repository, "gitolite@37.157.198.135:farnost"
#set :repository, "file:/home/gitolite/repositories/farnost.git"

set :application, "svatba"
set :repository, "gitbox:svatba"
set :deploy_to, "/u/apps/#{application}"
set :deploy_via, :remote_cache


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



# If you are using Passenger mod_rails uncomment this:






