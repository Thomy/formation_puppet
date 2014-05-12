class users::admin {

  group { 'sysadmin':
  ensure => present,
  gid    => '5000',

  }
}

