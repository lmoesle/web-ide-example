pipeline {
    agent any

    environment {
        SERVICE_NAME = 'web-ide-example'
        SCM_URL = 'https://github.com/lmoesle/web-ide-example'
    }

    stages {

        stage('Checkout') {
            steps {
                git(url: SCM_URL, credentialsId: '6499f04a-1dfe-41bd-ad28-72f5b9f9bcea', branch: '$BRANCH_NAME')
            }
        }

        stage('Build and Publish Container') {
            when {
                branch "main"
            }
            steps {
                script {
                    dockerImage = docker.build("lmoesle/web-ide-example:latest")
                    docker.withRegistry('','dockerhub-id'){
                        dockerImage.push('latest')
                    }
                }
            }
        }

    }

}