# Make changes to ssh client config file
file {'2-ssh_config':
    ensure  => 'present',
    path    => '/home/vagrant/alx-system_engineering-devops/0x0B-ssh/2-ssh_config',
    content => 'Host *\n\tIdentityFile /home/vagrant/.ssh/school\n\tPasswordAuthentication no\n';
}
