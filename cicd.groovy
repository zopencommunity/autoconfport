node('linux') 
{
        stage('Build') {
                build job: 'Port-Pipeline', parameters: [string(name: 'REPO', value: 'autoconfport'), string(name: 'DESCRIPTION', 'autoconfport' )]
        }
}
