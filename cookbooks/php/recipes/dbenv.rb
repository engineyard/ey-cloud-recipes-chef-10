# This recipe requires a deploy hook (https://support.cloud.engineyard.com/entries/21016568-Use-Deploy-Hooks)
# to symlink the .env.php file into the PHP application root after deploy
#
# in deploy/after_symlink.rb:
# run "ln -nfs #{config.shared_path}/config/.env.php #{config.release_path}/.env.php"
#

ey_cloud_report "php53" do
  message "Adding PHP database environment variables to .env.php"
end

if ['app_master', 'app', 'util', 'solo'].include?(node[:instance_role])
  node[:applications].each do |app_name, data|
    template "/data/#{app_name}/shared/config/.env.php" do
      source 'dotenv.php'
      owner node[:owner_name]
      group node[:owner_name]
      mode 0655
      backup 0
      action :create
      variables({
        :app_name => app_name,
        :php_env => node[:environment][:framework_env],
        :user => node[:owner_name],
        :dbuser => node[:owner_name],
        :dbpass => node[:owner_pass],
        :dbhost => node[:db_host],
        :dbreplicas => node[:db_slaves].join(':')
      })      
    end
  end
end