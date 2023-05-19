# debug error.
exec {'Ulimit':
    command  => 'sed -i "s/15/5000/" /etc/default/nginx && service nginx restart',
    provider => 'shell',
}
