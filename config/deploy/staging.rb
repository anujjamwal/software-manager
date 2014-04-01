set :stage, 'staging'
set :rails_env, 'staging'

set :rvm_ruby_version, '2.0.0@soft-manager'

role :app, %w{10.15.1.94}
role :sync, %w{10.15.1.94}
role :db,  %w{10.15.1.94}

server '10.15.1.94', roles: %w{sync app db}

set :ssh_options, {
    user: 'dsadmin',
    password: 'dsadmin'
}
