pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/nickjabs/jenkins-react-app'
            }
        }

        stage('Build') {
            steps {
                sh 'docker ps --filter name=node | grep node && docker kill node || true'
                sh 'docker run -d --rm --name node -v ${WORKSPACE}:/var/app -w /var/app node:lts-bullseye tail -f /dev/null'
                sh 'docker exec node npm --version'
                sh 'docker exec node ls -la'
                sh 'docker exec node npm ci'
                sh 'docker exec node npm run build'
                sh 'docker kill node'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-react-app:v1.0.0 -f ./Dockerfile .'
            }
        }

        stage('Start Application') {
            steps {
                sh 'docker run -d --name test -p 80:80 jenkins-react-app:v1.0.0'
            }
        }

        stage('Cleanup') {
            steps {
                deleteDir()
            }
        }
    }
}
