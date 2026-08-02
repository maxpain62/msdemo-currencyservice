podTemplate(yaml: readTrusted('pod.yaml')) {
    node(POD_LABEL) {
        stage('Checkout') {
            git branch: 'main', url: 'https://github.com/maxpain62/msdemo-currencyservice.git'
        }
        stage('build') {
            container('node-build') {
                sh '''
                    pwd
                    ls -la
                    npm install --only=production
                    ls -ls
                    sleep 5
                '''
            }
        }
    }
}