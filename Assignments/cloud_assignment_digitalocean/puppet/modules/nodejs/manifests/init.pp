#This manifest contains the provisioning for the appserver. 
#It installs the node js and curl and runs apt-get update before installations.

class nodejs {
	package{ 'nodejs':
			ensure => 'present',
			require => Exec['nn']
	}

	package{ 'curl':
			ensure => 'installed',
			require => Exec['aptget']
	}

	exec { 'aptget':
		command => '/usr/bin/apt-get update -y'
	}

	exec { 'nn':
		command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
		require => Exec['aptget']
	}
}	