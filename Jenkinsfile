pipeline{
    agent any

    environment {
        def appImage
        def appContainer
    }

    stages{
        stage("Checkout GitHub"){
            steps{
                git branch: 'main', credentialsId: 'jen-doc-git', url: 'https://github.com/mariancap/Docker-Test.git'
            }
        }
        stage("Build Docker Image"){

            steps{
                script{
                    appImage=docker.build("alpine-nginx-static"+"$BUILD_NUMBER")
                }
            }
        }
        stage("Run Docker Container"){
            steps{
                script{
                    appContainer=appImage.run("-d -p 8081:80")
                }
            }
        }
    }
}
