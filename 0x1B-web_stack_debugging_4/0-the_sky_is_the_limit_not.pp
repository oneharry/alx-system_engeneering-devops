exec {'soft':
    command => 'sed -i "s/15/4096/" /etc/default/nginx && service nginx restart',
    provider    => 'shell',

}
