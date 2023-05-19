exec {'soft':
    command => 'sed -i "s/15/5000/" /etc/default/nginx',
    path    => '/usr/local/bin/:/bin/',

}
exec {'restart-nginx':
    command => 'nginx restart',
    path    => '/etc/init.d/',
}
