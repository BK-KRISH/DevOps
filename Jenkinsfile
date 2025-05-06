pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/BK-KRISH/DevOps.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("poet-app")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    dockerImage.run("-p 8502:8501")
                }
            }
        }
    }
}
