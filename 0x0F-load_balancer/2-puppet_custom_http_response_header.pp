# Add cutom header to nginx server

exec {'add_header':
    provider => shell,
    command  => "sed -i \"s/server_name _;/location / {\n\tadd_header X-Served-By ${hostname};\n}/\" etc/nginx/sites-available/default",
}
#-> package {'nginx':
#    ensure => 'present'
#}
#-> file_line {
#    ensure => present,
#    path   => 'etc/nginx/sites-available/default',
#    line   => "\tlocation / {
#	    add_header X-Served-By ${hostname};
#    }",
#    match  => 'server_name _;'

#}
-> exec {'restart nginx':
        provider => shell,
        command  => 'sudo service nginx restart'
}
