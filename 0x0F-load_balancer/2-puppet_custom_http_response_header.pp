# Add cutom header to nginx server

exec {'add_header':
    provider => shell,
    command  => 'sudo apt-get update',
}
-> package {'nginx':
    ensure => present
}
-> file_line {
    ensure => present,
    path   => 'etc/nginx/sites-available/default',
    line   => "\tlocation / {
	    add_header X-Served-By ${hostname};
    },
    match  => '^\server_name _;'

}
-> exec {'restart nginx':
        provider => shell,
        command  => 'sudo service nginx restart'
}
