pipeline {
    
    agent {
        node{
            label "dev"
        }
    }

    stages {
        stage('Clone Code') {
            steps {
                git url: "https://github.com/rahulkadam09/beta.git", branch: "main"
                echo 'code cloned.'
                }
            }
        stage('Code Build') {
            steps {
                sh "docker build -t shama:latest ."
                echo 'Built the code.'
                
            }
        }
        stage('Push to docker Hub') {
            steps {
                withCredentials(
                    [usernamePassword(
                        credentialsId: "docker-hub-login",
                        passwordVariable: "dockerHubPass",
                        usernameVariable: "dockerHubUser"
                        )]
                    )
                    {
                        sh "docker image tag shama:latest ${env.dockerHubUser}/shama:latest"
                        sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                        sh "docker push ${env.dockerHubUser}/shama:latest"
                    }
                echo 'code pushed.'
                }
            }
        stage('Code Deploy') {
            steps {
                sh "docker stop shama && docker rm shama && docker run --name shama -d -p 9000:9000 rahulkadam09/shama:latest"
                echo 'Code Deployed.'
                }
            }
        
    }
}
