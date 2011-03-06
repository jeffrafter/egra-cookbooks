#
# Cookbook Name:: nodejs
# Definition:: npm_package
#

define :npm_package do
  
  package_name = params[:name]

  include_recipe "nodejs"
  include_recipe "nodejs::npm"

  bash "install npm #{package_name} package for node" do
    cwd "/usr/local/bin"
    # user "root"
    code <<-EOH
      npm install #{package_name}
    EOH
  end
end
