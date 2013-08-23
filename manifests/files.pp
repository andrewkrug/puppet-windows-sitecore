class windows-sitecore::files {
	#Create Data Directory
	file { 'C:/Data':
                recurse => false,
                ensure  => directory,
                owner   => 'NETWORK SERVICE',
                group   => 'Users',
                mode    => '7777',
        }

	#Create Transfers
	file { 'C:/transfer':
                recurse => true,
                ensure  => directory,
                owner   => 'Administrator',
                group   => 'Administrators',
                mode    => '7777',
        }

	#Maybe some of these files become ERB Templates for hostname stuff	
	#	file { 'C:/windows/system32/inetsrv/config':
	#	source  => 'puppet:///modules/windows-sitecore/iis-config',
	#	recurse => true,
	#	purge => true,
	#	owner   => 'System',
        #       group   => 'Administrators',
	#	mode => 1770,
	#	notify => Service["W3SVC"],
	#	}
	file {'C:/inetpub/wwwroot/Sites':
                ensure => directory,
                recurse => true,
                purge => false,
                owner   => 'Administrator',
                group   => 'Users',
                mode => '7777',
                notify => Service["W3SVC"],
        }


	file { 'C:/inetpub/wwwroot/Sites/OregonShakespeareFestivalList':
                source  => 'puppet:///modules/windows-sitecore/inetpub/wwwroot/Sites/OregonShakespeareFestivalList',
                ensure => directory,
		recurse => true,
                purge => false,
                owner   => 'Administrator',
                group   => 'Users',
		mode => '7777',
                notify => Service["W3SVC"],
        }
	
	#Manage Hosts File for Local Testing
	file { 'C:/windows/system32/drivers/etc/hosts':
                source  => 'puppet:///modules/windows-sitecore/hosts',
                purge => true,
                owner   => 'System',
                group   => 'Administrators',
        }

	file { 'C:/windows/temp/7za.exe':
		source => 'puppet:///modules/windows-sitecore/7za.exe',
		owner => 'Administrator',
		group => 'Administrators',
		mode => '7777',
	}
}

