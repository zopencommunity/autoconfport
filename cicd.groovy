node('linux') 
{
	stage ('Poll') {
		checkout([
			$class: 'GitSCM',
			branches: [[name: '*/main']],
 			doGenerateSubmoduleConfigurations: false, 
			extensions: [], 
			userRemoteConfigs: [[url: 'https://github.com/zopencommunity/autoconfport.git']]])
        }

	stage('Build') {
		build job: 'Port-Pipeline', parameters: [string(name: 'PORT_GITHUB_REPO', value: 'https://github.com/zopencommunity/autoconfport.git'), string(name: 'PORT_DESCRIPTION', value: 'Autoconf is an extensible package of M4 macros that produce shell scripts to automatically configure software source code packages.' ),  string(name: 'NODE_LABEL', value: "v2r4")]
	}
}
