# Make changes to ssh client config file
file {'school':
    ensure  => 'present',
    path    => '/tmp/school',
    content => 'Host *\n\tIdentityFile /home/vagrant/.ssh/school\n\tPasswordAuthentication no\n';
}
