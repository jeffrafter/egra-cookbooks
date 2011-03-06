require_recipe "apt"
require_recipe "build-essential"
require_recipe "nginx"
require_recipe "nodejs"

include_recipe "nodejs"
include_recipe "nodejs::npm"

log "===================================================="
log "Box contains: apt, build-essential, nginx, node, npm"
log "===================================================="

npm_package "coffee-script"

execute "coffee" do
  cwd "/srv/egra"
  command "nohup coffee -w -c -b -o /src/egra/ /srv/egra/*.coffee 1> /srv/egra/logs/coffee.out.log 2> /srv/egra/logs/coffee.err.log &"
  action :run
  environment ({})
end

