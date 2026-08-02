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
                    stash name: 'node_modules', includes: 'node_modules/**'
                '''
            }
        }
        stage('destination unstash') {
            container('buildkit') {
                unstash 'node_modules'
                sh '''
                    pwd
                    ls -la
                    sleep 5
                '''
            }
        }
    }
}