# This makes sure that baseconfig is added to the 'pre' run stage and is executed initially.

stage { 'pre':
	before => Stage['main']
}

class { 'baseconfig':
	stage => 'pre'
}


# I have used "include baseconfig" outside the node definitions because that way 
# all the nodes will include the baseconfig.

include baseconfig


# The nodejs class contains the provisioning for the appserver and installs nodejs which is why it has been included.

node 'appserver' {
	include nodejs
}

# The class dbserver contains the provisioning for the dbserver and installs mysql database which is why it has been included.

node 'dbserver' {
	include mysql-server
}


# The class nginx contains the provisioning for the web server and installs nginx which is why it has been included.

node 'web'{
	include nginx
}

# The below regular expression provides definitions for the test servers nodes.
# Since it only needs to run apt-get update command i have only included the baseconfig class which contains the update command.

node /tst\d+$/{
	include baseconfig
}