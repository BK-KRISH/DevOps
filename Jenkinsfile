pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/BK-KRISH/DevOps.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t poet-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                    docker stop poet-container || true
                    docker rm poet-container || true
                    docker run -d -p 8502:8501 --name poet-container poet-app
                '''
            }
        }
    }
}
