
# The below code installs the latest package of mysql-server and makes sure that the
# service is running when the machine starts up.
# "ensure=>running"ensures service is running.

class dbserver{

	package { ['mysql-server']:
    ensure => latest;
  }
    service { 'mysql':
    ensure  => running, 
    require => Package['mysql-server'];
  }
}