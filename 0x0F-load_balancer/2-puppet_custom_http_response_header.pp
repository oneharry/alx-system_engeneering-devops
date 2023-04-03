# Add cutom header to nginx server

exec {'update env':
    provider => shell,
    command  => 'sudo apt-get update',
}
-> package {'nginx':
    ensure => 'present',
}
-> file_line {'add_header':
    ensure => 'present',
    path   => '/etc/nginx/sites-available/default',
    line   => "   location / {
	    add_header X-Served-By ${hostname};",
    match  => '^\location / {',

}
-> exec {'restart nginx':
        provider => shell,
        command  => 'sudo service nginx restart'.
}
