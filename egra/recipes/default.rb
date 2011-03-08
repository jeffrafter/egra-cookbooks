require_recipe "apt"
require_recipe "build-essential"
require_recipe "nginx"
require_recipe "nodejs"

include_recipe "nodejs"
include_recipe "nodejs::npm"

log "===================================================="
log "Box contains: apt, build-essential, nginx, node, npm"
log "===================================================="

template "#{node[:nginx][:dir]}/sites-available/#{'egra'}" do
  source "nginx.conf.erb"
end

nginx_site "default" do
  enable false
end

nginx_site "egra" do
  enable true
end

npm_package "coffee-script"

# This script is kinda brutal as it runs every second. inotify is too laggy though
execute "coffee compiling watch script" do
  cwd "/srv/egra"
  command "nohup script/coffee &"
  action :run
end

