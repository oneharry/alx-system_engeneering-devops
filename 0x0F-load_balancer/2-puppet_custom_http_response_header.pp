# Add cutom header to nginx server

exec {'add_header':
        provider => shell,
        command  => "sed -i 's/server_name _;/add_header X-Served-By ${hostname};/' /etc/nginx/sites-available/default"
}
-> exec {'restart nginx':
        provider => shell,
        command  => 'sudo service nginx restart'
}
