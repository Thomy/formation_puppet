class apache::params inherits ::apache::version {
    if($::fqdn) {
      $servername = $::fqdn
    } else {
      $servername = $::hostname
    }
}
