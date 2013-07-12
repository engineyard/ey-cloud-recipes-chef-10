ey_cloud_report "php53" do
  message "Downgrading to PHP 5.3"
end

package "dev-lang/php" do
  version "5.3.27"
  action :install
end

bash "eselect-php5_3" do
  code <<-EOH
    eselect php set cli php5.3
    eselect php set fpm php5.3
    monit restart php-fpm
  EOH
  user "root"
end
