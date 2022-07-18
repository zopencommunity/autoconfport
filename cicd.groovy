node('linux') 
{
        stage('Build') {
                build job: 'Port-Pipeline', parameters: [string(name: 'REPO', value: 'autoconfport'), string(name: 'DESCRIPTION', 'Autoconf is an extensible package of M4 macros that produce shell scripts to automatically configure software source code packages.' )]
        }
}
