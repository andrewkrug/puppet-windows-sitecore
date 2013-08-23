include windows-iis

class { 'windows-sitecore':
		type => 'web',
		instance => 'staging',
		db_host => 'ec2-54-221-216-155.compute-1.amazonaws.com',
	}
