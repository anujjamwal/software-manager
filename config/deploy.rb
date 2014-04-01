# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'software-manager'
set :repo_url, 'https://github.com/anujjamwal/software-manager'
set :deploy_to, '/srv/app'

set :scm, :git
set :use_sudo, false
set :user, 'dsadmin'
set :scm_passphrase, 'dsadmin'
set :rails_env, 'staging'
set :stages, ['staging', "production"]

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :mkdir, "-p #{release_path}/tmp"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Link config'
  task :link_config do
    on roles(:app) do
      execute :ln, "-nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
      execute :ln, "-nfs #{deploy_to}/shared/config/auth.yml #{release_path}/config/auth.yml"
      execute :ln, "-nfs #{deploy_to}/shared/config/config.yml #{release_path}/config/config.yml"
    end
  end

  desc 'Runs rake db:seed'
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end

  desc 'Update whenever cron job config'
  task :whenever => [:set_rails_env] do
    on roles(:sync) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec whenever --update-crontab --set environment=#{fetch(:rails_env)}"
        end
      end
    end
  end
end

#after 'deploy:update_code', 'deploy:link_config'
before 'deploy:migrate', 'deploy:link_config'
after 'deploy:migrate', 'deploy:seed'
after :deploy, 'deploy:restart'
after :deploy, 'deploy:whenever'
