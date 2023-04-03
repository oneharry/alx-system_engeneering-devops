# Add cutom header to nginx server

#exec {'add_header':
#       provider => shell,
#        command  => "sed -i 's/server_name _;/add_header X-Served-By ${hostname};/' /etc/nginx/sites-available/default"
#}
#-> exec {'restart nginx':
#        provider => shell,
#        command  => 'sudo service nginx restart'
#}

class nginx_custom_header {
    package { 'nginx':
    ensure => installed,
    }

    service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
    }

    file { '/etc/nginx/conf.d/custom_headers.conf':
        ensure  => file,
        owner   => 'root',
	group   => 'root',
	mode    => '0644',
        content => template('nginx_custom_header/custom_headers.conf.erb'),
	notify  => Service['nginx'],
    }
}

file { '/etc/puppetlabs/code/environments/production/modules/nginx_custom_header/templates/custom_headers.conf.erb':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    content => "server {\n\tadd_header X-Served-By \"$::hostname\";\n}\n",
}
