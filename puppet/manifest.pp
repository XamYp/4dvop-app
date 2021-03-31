package { 'epel-release':
  ensure => installed,
}

package { 'nginx':
  ensure => installed,
}

package { 'git':
  ensure => installed,
}

service { 'nginx':
  ensure => running,
  enable => true,
}

exec { "open-port-80": 
  command => "firewall-cmd --zone=public --add-port=80/tcp --permanent",
  path => "/bin/",
}

exec { "firewall-reload": 
  command => "firewall-cmd --reload",
  path => "/bin/",
}

exec { "remove-default-website": 
  command => "rm -Rf /usr/share/nginx/html/*",
  path => "/bin/",
}

exec { "clone website": 
  command => "git clone https://github.com/diranetafen/static-website-example.git /usr/share/nginx/html/",
  path => "/bin/",
}
