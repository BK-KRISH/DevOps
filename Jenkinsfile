pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/YourUsername/your-repo.git'
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
                    dockerImage.run("-p 8501:8501")
                }
            }
        }
    }
}
