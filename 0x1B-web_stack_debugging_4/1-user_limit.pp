#new user can login and open file
exec {'soft':
    command  => 'sed -i "holberton soft/s/4/4000/" /etc/security/limits.conf',
    provider => 'shell'

}

exec {'hard':
    command  => 'sed -i "holberton hard/s/5/5000/" /etc/security/limits.conf',
    provider => 'shell'
}
