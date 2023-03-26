# Make changes to ssh client config file
exec {'echo "IdentityFile ~/.ssh/school\nPasswordAuthentication no" >> /etc/ssh/ssh_config':
    path    => '/bin/'
}
