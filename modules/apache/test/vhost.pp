class { 'apache': }

apache::vhost { 'montest.puppetlabs.vm':
  port     => '80',
  ip       => '10.27.12.172',
  docroot  => '/var/www/montest',
  priority => '100',
}
