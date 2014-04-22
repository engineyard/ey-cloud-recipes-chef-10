env[PHP_ENV] = <%= @php_env %>
<% unless @dbhost.nil? || @dbhost.empty? %>
env[DB_HOST] = <%= @dbhost %>
env[DB_NAME] = <%= @app_name %>
env[DB_USER] = <%= @dbuser %>
env[DB_PASS] = <%= @dbpass %>
<% end %>
<% unless @dbreplicas.nil? || @dbreplicas.empty? %>
env[DB_REPLICAS] = <%= @dbreplicas %>
<% end %>