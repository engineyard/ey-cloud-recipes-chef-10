# Downgrade to PHP 5.3
#include_recipe "php::php53"

# Add custom environment variables to PHP
#include_recipe "php::environment_variables"

# Add pecl modules
#include_recipe "php::pecl"

# Add database environment variables to PHP for use by CLI (drops a .env.php file in place)
#include_recipe "php::dbenv"
