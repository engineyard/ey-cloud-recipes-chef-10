ey_cloud_report "php53" do
  message "Adding PHP environment variables"
end

if ['app_master', 'app', 'util', 'solo'].include?(node[:instance_role])
  node[:applications].each do |app, data|
    template "/data/#{app}/shared/config/env.custom" do
      source 'env.custom.erb'
      owner node[:owner_name]
      group node[:owner_name]
      mode 0655
      backup 0
      action :create
    end
  end
end
