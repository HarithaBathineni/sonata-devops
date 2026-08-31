

pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "my-app:${env.BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Standard shell command to build the image from the root Dockerfile
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        
        stage('Push Docker Image') {
            steps {
                // Securely injects credentials to log in and push via shell
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials-id', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh "echo ${PASS} | docker login -u ${USER} --password-stdin"
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
