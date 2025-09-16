pipeline {
    agent any

    tools {
        maven 'Maven-3.9.5'   // Jenkins Maven installation
        jdk 'JDK17'           // Jenkins JDK installation
    }

    environment {
        IMAGE_NAME = "my-java-app"
        CONTAINER_NAME = "java-app-container"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/BK-KRISH/DevOps.git', branch: 'main'
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                bat """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} -p 8080:8080 ${IMAGE_NAME}
                """
            }
        }
    }
}
