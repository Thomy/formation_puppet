$httpdpkgname = $::operatingsystem ? {
    'ubuntu'  => 'httpd',
    'debian'  => 'httpd',
    'redhtat'  => 'apache',
}
