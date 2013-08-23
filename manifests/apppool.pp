class windows-sitecore::apppool{
	iis_apppool {'CacheLayer6':
    		ensure                => present,
    		managedpipelinemode   => 'Integrated',
    		managedruntimeversion => 'v4.0',
  	}

	iis_apppool {'JCASYOS':
                ensure                => present,
                managedpipelinemode   => 'Integrated',
                managedruntimeversion => 'v4.0',
        }

	iis_apppool {'OregonShakespeareFestivalAppPool':
                ensure                => present,
                managedpipelinemode   => 'Integrated',
                managedruntimeversion => 'v4.0',
        }
	
	iis_apppool {'OregonShakespeareFestivalList':
                ensure                => present,
                managedpipelinemode   => 'Integrated',
                managedruntimeversion => 'v4.0',
        }

	iis_site {'Default Web Site':
		ensure		=> absent,
	}
	
	iis_site {'OregonShakespeareFestival':
		ensure => present,
		bindings => ["http/*:80:"],
	}

	iis_app {'OregonShakespeareFestival/':
		ensure => present,
		applicationpool => 'OregonShakespeareFestivalAppPool',
	}

	iis_vdir {'OregonShakespeareFestival/':
   		 ensure          => present,
    		 iis_app         => 'OregonShakespeareFestival/',
	         physicalpath    => 'C:\Data\Projects\OregonShakespeareFestival\SitecoreWebsite\Main\Source\Sitecore\Authoring\Website'
  	}

        iis_site {'OregonShakespeareFestivalList':
                ensure => present,
                bindings => ["http/*:80:OregonShakespeareFestivalList"],
        }

        iis_app {'OregonShakespeareFestivalList/':
                ensure => present,
                applicationpool => 'OregonShakespeareFestivalList',
        }

        iis_vdir {'OregonShakespeareFestivalList/':
                 ensure          => present,
                 iis_app         => 'OregonShakespeareFestivalList/',
        	 physicalpath    => 'C:\inetpub\wwwroot\Sites',
		}

	iis_site {'JCASYOS':
                ensure => present,
                bindings => ["http/*:81:"],
        }

        iis_app {'JCASYOS/':
                ensure => present,
                applicationpool => 'JCASYOS',
        }

        iis_vdir {'JCASYOS/':
                 ensure          => present,
                 iis_app         => 'JCASYOS/',
                 physicalpath    => 'C:\Data\Projects\JCA\SYOSv4',
                }
}
