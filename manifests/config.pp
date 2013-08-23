class windows-sitecore::config($type,$instance,$db_host) {
	file { 'C:\Windows\Temp\wget.vbs':
		owner => 'Administrator',
		group => 'Administrators',
		source => 'puppet:///modules/windows-sitecore/wget.vbs',
		mode => '7777',
	}

#	file { 'C:\transfer\fetch-files.bat':
#		owner => 'Administrator',
#		group => 'Administrators',
#		source => 'puppet:///modules/windows-sitecore/fetch-files.bat',
#		mode => '7777',
#	}

#	exec { 'C:\\transfer\\fetch-files.bat':
#		command => 'C:\\transfer\\fetch-files.bat',
#		require => File['C:\transfer\fetch-files.bat'],
#		timeout => 0,
#	}

	file { 'C:/windows/temp/remoteconnection.reg':
		source => 'puppet:///modules/windows-sitecore/remoteconnection.reg',
		owner => 'Administrator',
		group => 'Administrators',
		mode => 7777,
	}
	exec { 'C:\\Windows\\regedit.exe':
		command => "C:\\Windows\\regedit.exe /s C:\\Windows\\temp\\remoteconnection.reg",
		require => File["C:/windows/temp/remoteconnection.reg"],
		notify => Service["W3SVC"],
		refreshonly => true,
	}
	
}
