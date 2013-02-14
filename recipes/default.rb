#
# Cookbook Name:: zf2_vagrant_aio
# Recipe:: default
#
# Copyright 2013, Ryan J. Geyer <me@ryangeyer.com>
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2::default"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "mysql::server"

package "php-pdo"
package "php-mysql"

web_app "zf2" do
  # This is not used, but is required for the provider
  server_name "0.0.0.0"
  docroot "/vagrant/public"
end

# TODO: Possibly write a /vagrant/config/autoload/local.php config file
# with DB info, though we *know* the DB creds if everything gets left alone

execute "Create the database schema if it does not exist" do
  command "/usr/bin/mysqladmin -u root -p#{node["mysql"]["server_root_password"]} create #{node["zf2_vagrant_aio"]["db"]["schema"]}"
  not_if "/usr/bin/mysql -u root -p#{node["mysql"]["server_root_password"]} -e 'show databases;' | grep #{node["zf2_vagrant_aio"]["db"]["schema"]}"
end

bash "Initialize the DB Schema" do
  cwd "/vagrant"
  code <<-EOF
vendor/bin/doctrine-module orm:schema-tool:drop --force
vendor/bin/doctrine-module orm:schema-tool:create
  EOF
end

# TODO: Optionally load some fixture data?

service "httpd" do
  action :restart
end