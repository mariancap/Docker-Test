def appContainer
def appImage

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
        stage("Test Docker Container"){
            steps{
                script{
                    sleep 10
                    sh 'curl http://localhost:8081'
                }
            }
        }
        stage("Clean up"){
            steps{
                script{
                    sh 'docker system prune -a --volumes -f -y'
                }
            }
        }
    }
}
