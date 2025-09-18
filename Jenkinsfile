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
        stage("Cleanup old containers (by name prefix)") {
            steps {
                script {
                    sh '''
                        set -e
                        old=$(docker ps -aq --filter "name=^alpine-nginx-static-") || true
                        if [ -n "$old" ]; then
                        docker rm -f $old
                        fi
                    '''
                }
            }
        }
        stage("Build Docker Image"){
            steps{
                script{
                    appImage = docker.build("alpine-nginx-static:${BUILD_NUMBER}")
                }
            }
        }
        stage("Run Docker Container"){
            steps{
                script{
                    appContainer = appImage.run("--name alpine-nginx-static-${BUILD_NUMBER} -d -p 8081:80")
                }
            }
            }
        stage("Test Docker Container"){
            steps{
                script{
                    sleep 10
                    sh 'curl -f http://host.docker.internal:8081'
                }
            }
        }
        }
        post{
            success{
                script{
                    sh 'docker image prune -f || true'
                    echo "The container ${appContainer.id} is running the image ${appImage.id}"
                }
            }
            failure{
                script{
                    if (appContainer) {
                        sh "docker rm -f ${appContainer.id} || true"
                    }
                }
            }
        }

    }
