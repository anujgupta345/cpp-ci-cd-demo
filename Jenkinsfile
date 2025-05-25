pipeline {
    agent any

    environment {
        IMAGE_NAME = "anujcicd/hello-cpp"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', 
                          branches: [[name: 'refs/heads/main']], 
                          userRemoteConfigs: [[url: 'https://github.com/anujgupta345/cpp-ci-cd-demo']]])
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    dockerImage.inside {
                        sh './hello'
                    }
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-creds', url: '']) {
                    script {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}

