ey_cloud_report "php-pecl" do
  message "Installing PECL Packages"
end

if ['app_master', 'app', 'util', 'solo'].include?(node[:instance_role])
  bash "install_pecl" do
    user "root"
    code <<-EOH
      pecl install oauth
    EOH
  end
end
