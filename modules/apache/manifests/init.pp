class apache  (
      $servername           = $::apache::params::servername,
) inherits ::apache::params {

      File {
          owner => 'apache',
          group => 'apache',
          mode  => '0644',
      }
      package { 'httpd':
          ensure => present,
      }
      service { 'httpd':
          ensure    => running,
          enable    => true,
          subscribe =>  File['/etc/httpd/conf/httpd.conf'],
      }
      file { '/var/www':
          ensure => directory,
      }
      file { '/var/www/html':
          ensure => directory,
      }
      file { '/var/www/html/index.html':
          owner   => 'root',
          group   => 'root',
          content => template('apache/index.html.erb'),
      }
      file { '/etc/httpd/conf/httpd.conf':
          ensure  => present,
          owner   => 'root',
          group   => 'root',
          source  =>'puppet:///modules/apache/httpd.conf',
          require => Package['httpd'],
      }
}
