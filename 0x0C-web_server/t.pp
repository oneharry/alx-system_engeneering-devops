# install and configure Nginx server

exec { 'nginx':
    provider => shell;
    command  => ['sudo apt-get update', 'sudo apt-get install -y nginx',
	     'mkdir /var/www/root', ],
}

file { '/var/www/root':
    ensure => 'directory',
}

file {'index.html':
    ensure  => 'present',
    path    => '/var/www/root/index.html',
    content => 'Hello World!',
    owner   => 'root',
    mode    => '0755',
}
file {'default':
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    content => 'server {
	    listen 80 default_server;
	    listen [::]:80 default_server;
	    root /var/www/root;
	    index index.html index.htm;

	    location /redirect_me {
		    return 301 http://test.com;
	    }
    }'
}
exec {'service nginx':
    provider => shell;
    command  => ['service nginx restart'];
}
