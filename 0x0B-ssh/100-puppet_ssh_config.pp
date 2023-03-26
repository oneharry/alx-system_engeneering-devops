# Make changes to ssh client config file
file {'/home/vagrant/alx-system_engineering-devops/0x0B-ssh/2-ssh_config':
    ensure  => 'present',
    content => 'IdentifyFile ~/.ssh/school';
}
