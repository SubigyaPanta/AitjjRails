# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'WAE'
set :repo_url, 'git@vgl-ait.org:web16-05.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/homw/deployer/WAE'

# Default value for :scm is :git
set :scm, :git
set :branch, 'master'
set :repo_tree, 'WAE'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
#set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# For restarting apache
set :passenger_restart_with_touch, true

#Default branch is :master
# ask :branch, git rev-parse --abbrev-ref HEAD'.chomp
set :stages, ['production']
set :default_stage, 'production'
set :user, 'deployer'

# set ruby version
set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'


# Add this in config/deploy.rb
# and run 'cap production deploy:seed' to seed your database
# namespace :deploy do
#   desc 'Runs rake db:seed'
#   task :seed => [:set_rails_env] do
#     on primary fetch(:migration_role) do
#       within release_path do
#         with rails_env: fetch(:rails_env) do
#           execute :rake, "db:seed"
#         end
#       end
#     end
#   end
# end
set :rails_env, fetch(:production)

namespace :deploy do
  desc 'Runs rake db:seed'
  task :seed do
    # execute :rake, "db:seed"
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end
