set :application, 'translation-assistant'
set :repository,  'git://github.com/sowcow/help-translate.git'

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, 'localhost'          #"your web-server here"                          # Your HTTP server, Apache/etc
role :app, 'localhost'          #"your app-server here"                          # This may be the same as your `Web` server
role :db,  'localhost', primary: true          #"your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  'localhost'          #"your slave db-server here"

#set :port, 2222
set :user, "translation-assistant"
#set :user, 'root'

set :deploy_to, "/home/translation-assistant/apps/#{application}"
set :use_sudo, true #false
set :keep_releases, 5
set :deploy_via, :copy

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end