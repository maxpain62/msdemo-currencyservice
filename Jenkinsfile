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
        stage('Build Docker Image') {
            container('buildkit') {
            unstash name: 'node_modules'
            sh """
                    ls -la
                    buildctl --addr tcp://buildkitd.devops-tools.svc.cluster.local:1234\
                    --tlscacert /certs/ca.pem\
                    --tlscert /certs/cert.pem\
                    --tlskey /certs/key.pem\
                    build --frontend dockerfile.v0\
                    --opt filename=Dockerfile --local context=.\
                    --local dockerfile=.\
                    --output type=image,name=134448505602.dkr.ecr.ap-south-1.amazonaws.com/msdemo-currencyservice,push=true
                """
            }
        }
    }
}