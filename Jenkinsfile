pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            // Use the Git plugin to checkout the code
            git branch: 'master', url: 'https://github.com/nickjabs/jenkins-react-app'
        }
        stage('Build') {
            // Previous build steps remain unchanged
            sh 'docker ps --filter name=node | grep node && docker kill node || true'
            sh 'docker run -d --rm --name node -v ${WORKSPACE}:/var/app -w /var/app node:lts-bullseye tail -f /dev/null'
            sh 'docker exec node npm --version'
            sh 'docker exec node ls -la'
            sh 'docker exec node npm ci'
            sh 'docker exec node npm run build' // Build the React-App
            sh 'docker kill node'
            
            // Build Docker image after React build
            sh 'docker build -t jenkins-react-app:v1.0.0 -f ./Dockerfile .'
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using the personal access token
                    sh "docker login -u kikibuh -p dckr_pat_dgcRh07yYtqCULpR2vC3bkOk2_4"
                    // Push the Docker image to Docker Hub
                    sh 'docker push kikibuh/jenkins-react-app:v1.0.0'
                }
            }
        }
        stage('Logout from Docker Hub') {
            steps {
                script {
                    // Log out from Docker Hub
                    sh 'docker logout'
                }
            }
        }
        stage('Cleanup') {
            // Use the Git plugin to checkout the code
            deleteDir()
        }
    }
}
