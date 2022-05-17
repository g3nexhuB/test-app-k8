pipeline {
    agent any
    environment{
        
        dockerhub=credentials('dockerhub')
        
    }
    stages {
        stage('CleanupRepo') {
            steps {

                sh 'cd /var/lib/jenkins/workspace/jenkins-pipeline/ && rm -rf *'
                // sh 'sudo docker stop flask-app && sudo docker rm flask-app'
                // sh 'ssh genex@192.168.56.102 "sudo docker stop flask-app && sudo docker rm flask-app" '
                
            }
        }
        stage('PullrepoBuildImage') {
            steps {
                sh 'git clone https://github.com/g3nexhuB/test-app-k8/ && cd /var/lib/jenkins/workspace/jenkins-pipeline/test-app-k8 && sudo docker build -t flask-app .'
                echo 'Verify the build images'
                sh 'sudo docker images -a'
                
            }
        }
        stage('RunApp') {
            steps {
                
                sh 'sudo docker run -it --rm -d -p 5000:5000 --name flask-app flask-app'
                echo 'Verify the docker containers'
                sh 'sudo docker ps -a'
            }
        }
        // stage('VerifyCurl') {
        //     steps {
                
        //         echo 'Verify using curl'
        //         sh 'curl localhost:5000'
                
        //     }
        // }

        stage ('Push to registry'){
        input{
          message "Do you want to proceed for Push to registry?"
        }
          steps {
                      sh 'echo "Push"'
         
                }
        } 
        
        stage('PushtoDockerRepo') {
            steps {
                
                sh 'sudo docker tag flask-app g3nex/flask-app'
                sh  'echo $dockerhub_PSW | sudo docker login -u $dockerhub_USR  --password-stdin'
                sh 'sudo docker push g3nex/flask-app'
                
            }
        }
        stage('ProvisionDeploy') {
            steps {
                
                sh  'echo $dockerhub_PSW | sudo docker login -u $dockerhub_USR  --password-stdin'
                sh 'ssh genex@192.168.56.102 "echo $dockerhub_PSW |sudo docker login -u $dockerhub_USR  --password-stdin && sudo docker pull g3nex/flask-app" '
                sh 'ssh genex@192.168.56.102 "sudo docker run -it --rm -d -p 5000:5000 --name flask-app g3nex/flask-app" '
                echo 'Test Verify on the remote host'
                sh 'sleep 30'
                sh 'curl http://192.168.56.102:5000'
                
            }
        }
    }
}
