node {
  stage('Checkout') {
    // Use the Git plugin to checkout the code
    git branch: 'master', url: 'https://github.com/0xfabio/jenkins-react-app.git'
  }
  stage('Build') {
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

  stage('Cleanup') {
    // Use the Git plugin to checkout the code
    deleteDir()
  }
}
