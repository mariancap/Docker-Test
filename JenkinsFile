pipeline{
    agent any

    stages{
        stage("Checkout GitHub"){
            steps{
                git branch: 'main', credentialsId: 'jen-doc-git', url: 'https://github.com/mariancap/Docker-Test.git'
            }
        }
        stage("Build Docker Image"){

            steps{
                script{
                    docker.build("alpine-nginx-static"+"$BUILD_NUMBER")
                }
            }

        }
    }
}
