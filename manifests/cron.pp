class windows-sitecore::cron {
	scheduled_task { 'CacheLoader' :
			ensure => present,
			enabled => true,
			command => 'C:\Data\Projects\JCA\CacheLoader\CacheLoader.exe',
			trigger => {
				schedule => daily,
				start_time => '12:00',
				every	=> 1,
				}	
		}
}
