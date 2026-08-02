podTemplate(yaml: readTrusted('pod.yaml')) {
    node(POD_LABEL) {
        stage('Checkout') {
            git branch: 'main', url: 'https://github.com/maxpain62/msdemo-currencyservice.git'
        }
        stage('build') {
            container('node-build') {
                sh '''
                npm install --only=production
                cp -r /node_modules ./node_modules
                pwd 
                sleep 60s
                ls -la
                sleep 60s
                '''
            }
        }
    }
}