# Definition: apache::vhost
define apache::vhost(
    $docroot,
    $port                        = undef,
    $ip                          = undef,
    $priority                    = undef,
    $filename                    = $name,
    $servername                  = $name,
    $options                     = ['Indexes','FollowSymLinks','MultiViews'],
    $override                    = ['None'],
    $directoryindex              = '',
    $vhost_name                  = '*',
  ) {

  $listen_addr_port = "${ip}:${port}"
  $vhost_dir = "/etc/httpd/conf.d/"

  file { "${priority}-${filename}.conf":
    ensure  => file,
    path    => "$vhost_dir/${priority}-${filename}.conf",
    content => template('apache/vhost.conf.erb'),
    owner   => 'root',
    mode    => '0644',
    require => [
      Package['httpd'],
    ],
    notify  => Service['httpd'],
  }

  file { "$docroot":
    ensure => directory,
    path   => $docroot,
  }
  file { "$docroot/index.html":
    ensure  => file,
    content => template('apache/index.html.erb'),
    path    => "$docroot/index.html",
  }
}
