# Make changes to ssh client config file
exec {'echo "IdentityFile ~/.ssh/school\nPasswordAuthentication no" >> 2-ssh_config':
    path    => '/bin/'
}
