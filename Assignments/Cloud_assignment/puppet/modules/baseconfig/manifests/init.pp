# The purpose of this code is to execute the apt-get update command.

class baseconfig {
  exec { 'apt-get update':
  command => '/usr/bin/apt-get update -y'
}
}