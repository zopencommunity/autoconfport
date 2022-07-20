node('linux') 
{
	stage ('Poll') {
		checkout([
			$class: 'GitSCM',
			branches: [[name: '*/main']],
 			doGenerateSubmoduleConfigurations: false, 
			extensions: [], 
			userRemoteConfigs: [[url: 'https://github.com/ZOSOpenTools/autoconfport.git']]])
        }

	stage('Build') {
		build job: 'Port-Pipeline', parameters: [string(name: 'REPO', value: 'autoconfport'), string(name: 'DESCRIPTION', value: 'Autoconf is an extensible package of M4 macros that produce shell scripts to automatically configure software source code packages.' )]
	}
}
