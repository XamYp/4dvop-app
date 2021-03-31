
###############################
# Packages installation #
###############################

# could be simplified by << package 'epel-release' >> (install is the default action)
package 'epel-release' do
 action :install
end

package 'nginx'

package 'haproxy' 

package 'git' 


###############################
# Clone website #
###############################

directory "/usr/share/nginx/html" do
    recursive true
    action :delete
end

git "/usr/share/nginx/html/" do
  repository 'https://github.com/diranetafen/static-website-example.git'  
  action :sync
end


###############################
# Configure and start nginx #
###############################

execute 'put nginx on 8080 port' do
    command "/bin/sed -i 's/80 default_server/8080 default_server/g' /etc/nginx/nginx.conf"
end

service 'nginx' do
    action [ :enable, :start ]
end


###############################
# Configure and start haproxy #
###############################
cookbook_file '/etc/haproxy/haproxy.cfg' do
    source 'haproxy.cfg'
    action :create
end

service 'haproxy' do
    action [ :enable, :start ]
end


###############################
# Firewall configuration #
###############################

execute 'open-port-80' do
    command '/bin/firewall-cmd --zone=public --add-port=80/tcp --permanent'
end

execute 'firewall-reload' do
    command '/bin/firewall-cmd --reload'
end
