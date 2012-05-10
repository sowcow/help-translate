#set :rvm_bin_path, "$HOME/bin"
set :rvm_bin_path, "/usr/share/ruby-rvm/bin"
set :rvm_type, :system

require 'rvm/capistrano'
require "bundler/capistrano"
load 'deploy/assets'

#default_run_options[:shell] = 'bash'

set :application, 'translation-assistant'
set :repository,  'git://github.com/sowcow/help-translate.git'

set :scm, :git

role :web, 'localhost'
role :app, 'localhost'
role :db,  'localhost', primary: true

set :port, 22
set :user, "translation-assistant"

set :deploy_to, "/home/translation-assistant/apps/#{application}"
set :use_sudo, false
set :keep_releases, 5

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
