# Role-based syntax
role :app, %w{deployer@192.41.170.116}
role :web, %w{deployer@192.41.170.116}
role :db,  %w{deployer@192.41.170.116}, :primary => true

# Configurations
set :branch, 'master'
set :rails_env, 'production'
set :deploy_to, '/home/deployer/WAE'

set :default_env,{
    'BAZOOKA_USER' => ENV['BAZOOKA_USER'],

    "http_proxy" => "http://192.41.170.23:3128",
    "https_proxy" => "http://192.41.170.23:3128",
    "ftp_proxy" => "http://192.41.170.23:3128",
    "rsync_proxy" => "http://192.41.170.23:3128",
    "no_proxy" => "localhost,127.0.0.1,localaddress,.localdomain.com",

    "HTTP_PROXY" => $http_proxy,
    "HTTPS_PROXY" => $https_proxy,
    "FTP_PROXY" => $ftp_proxy,
    "RSYNC_PROXY" => $rsync_proxy,
    "NO_PROXY" => $no_proxy
}

# Global options
# --------------
# set :ssh_options, {
#     keys: %w(/home/subigya/.ssh/AIT_KEYS),
#     forward_agent: true,
#     auth_methods: %w(publickey password),
#     #password: 'navyblue'
# }

#Custom SSH Options
server 'web5.cs.ait.ac.th',
 user: 'deployer',
 roles: %w{web app db},
 ssh_options: {
   user: 'deployer',
   keys: %w(/home/subigya/.ssh/AIT_KEYS),
   forward_agent: true,
   auth_methods: %w(publickey password)
   #password: 'navyblue'
}