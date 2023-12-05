node {
    stage('Checkout') {
        // Use the Git plugin to checkout the code
        git branch: 'master', url: 'https://github.com/nickjabs/jenkins-react-app'
    }
    
    stage('Build') {
        // Führe den React-Build durch
        sh 'docker ps --filter name=node | grep node && docker kill node || true'
        sh 'docker run -d --rm --name node -v ${WORKSPACE}:/var/app -w /var/app node:lts-bullseye tail -f /dev/null'
        sh 'docker exec node npm --version'
        sh 'docker exec node ls -la'
        sh 'docker exec node npm ci'
        sh 'docker exec node npm run build' // Hier wird der Build der React-App ausgeführt
        sh 'docker kill node'
        
        // Build des Docker-Images nach dem React-Build
        sh 'docker build -t jenkins-react-app:v1.0.0 -f ./Dockerfile .'
    }

    stage('Deploy to EC2') {
        steps {
            script {
                // Stelle sicher, dass du dem Container einen Namen gibst und beim nächsten Ausführen überschreibst
                sh 'docker stop test || true' // Stoppe den Container, falls er läuft
                sh 'docker rm test || true'   // Lösche den Container, falls er existiert
                
                // Starte den Container auf der EC2-Instanz mit Port-Mapping
                sh 'ssh ubuntu@3.79.229.174 "docker run -d --name test -p 80:80 jenkins-react-app:v1.0.0"'
            }
        }
    }
    
    stage('Cleanup') {
        // Verzeichnis bereinigen
        deleteDir()
    }
}
