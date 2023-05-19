#new user can login and open file
exec {'soft':
    command  => 'sed -i "holberton soft nofile/s/4/4000/" /etc/security/limits.conf',
    provider => 'shell',

}

exec {'hard':
    command  => 'sed -i "holberton soft nofile/s/5/5000/" /etc/security/limits.conf',
    provider => 'shell',
}
