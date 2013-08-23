class windows-sitecore($type,$instance,$db_host){
	
	#Won't work without the forge module

	include windows-sitecore::files
	include windows-sitecore::cron
	include windows-sitecore::apppool
	
	class { 'windows-sitecore::config':
		type => $type,
		instance => $staging,
		db_host => $db_host,
	}	

	service { 'W3SVC':
		ensure => 'running',
		enable => 'true',
	}

	service { 'aspnet_state':
                ensure => 'running',
                enable => 'true',
        }		

}
