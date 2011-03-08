require_recipe "apt"
require_recipe "build-essential"
require_recipe "nginx"
require_recipe "nodejs"

include_recipe "nodejs"
include_recipe "nodejs::npm"

require_recipe "python"
require_recipe "couchdb::source"

python_pip "couchapp"

npm_package "coffee-script"

log "================================================================"
log "Box contains: apt, build-essential, node, npm, couchdb, couchapp"
log "================================================================"

# This script is kinda brutal as it runs every second. inotify is too laggy though
execute "coffee compiling watch script" do
  cwd "/srv/egra"
  command "cd /srv/egra; nohup scripts/coffee_watcher.sh 1> /srv/egra/log/coffee.out.log 2> /srv/egra/log/coffee.err.log &"
  action :run
end

