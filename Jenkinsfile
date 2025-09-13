pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/BK-KRISH/DevOps.git', branch: 'main'
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t poet-app:%BUILD_NUMBER% ."
            }
        }

        stage('Run Container') {
            steps {
                bat '''
                    docker stop poet-container || exit 0
                    docker rm poet-container || exit 0
                    docker run -d -p 8502:8501 --name poet-container poet-app:%BUILD_NUMBER%
                '''
            }
        }
    }
}

