exec {'soft':
	command => 'sed -i "s/15/5000" /etc/default/nginx && service nginx restart',
	path	=> '/usr/local/bin/:/bin/',

}
