ey_cloud_report "php-zendopcache" do
  message "Installing Zend OpCache"
end

if ['app_master', 'app', 'util', 'solo'].include?(node[:instance_role])
  install_path = `php -r 'echo ini_get("extension_dir");'`
  bash "install_zendopcache" do
    user "root"
    code <<-EOH
      rm -f /etc/php/*-php5.4/ext-active/apc.ini

      pecl install zendopcache-beta

      echo "zend_extension=#{install_path}/opcache.so
        opcache.memory_consumption=128
        opcache.interned_strings_buffer=8
        opcache.max_accelerated_files=4000
        opcache.revalidate_freq=60
        opcache.fast_shutdown=1
        opcache.enable_cli=1" > /etc/php/fpm-php5.4/ext/opcache.ini

      cp /etc/php/fpm-php5.4/ext/opcache.ini /etc/php/cli-php5.4/ext/opcache.ini
      cp /etc/php/fpm-php5.4/ext/opcache.ini /etc/php/cgi-php5.4/ext/opcache.ini

      rm -f /etc/php/fpm-php5.4/ext-active/opcache.ini
      rm -f /etc/php/cli-php5.4/ext-active/opcache.ini
      rm -f /etc/php/cgi-php5.4/ext-active/opcache.ini

      ln -s /etc/php/fpm-php5.4/ext/opcache.ini /etc/php/fpm-php5.4/ext-active/opcache.ini
      ln -s /etc/php/cli-php5.4/ext/opcache.ini /etc/php/cli-php5.4/ext-active/opcache.ini
      ln -s /etc/php/cgi-php5.4/ext/opcache.ini /etc/php/cgi-php5.4/ext-active/opcache.ini

      /etc/init.d/php-fpm reload
    EOH
  end
end
