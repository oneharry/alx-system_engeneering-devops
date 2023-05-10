# fixing 500 err message

exec {'fx-505':
    command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
    path    => '/bin';
}
