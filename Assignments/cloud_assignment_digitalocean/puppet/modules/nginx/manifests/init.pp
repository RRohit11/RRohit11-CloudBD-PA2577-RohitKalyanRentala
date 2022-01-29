# The below code makes sure that the 'nginx' package is installed.
# The ensure =>running in the service makes sure that the machine is up and running.
# "ensure=>running"ensures service is running.

class nginx {
  package { 'nginx':
    ensure => present;
  }

  service { 'nginx':
    ensure  => running,
    require => Package['nginx'];
  }
  
 }