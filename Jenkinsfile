pipeline {
    agent any

    environment {
        IMAGE_NAME = "poet-app"
        CONTAINER_NAME = "poet-container"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/BK-KRISH/DevOps.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    docker run -d -p 8502:8501 --name ${CONTAINER_NAME} ${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }
    }
}
