#raviteja
node {
    stage("gt checkout"){
        git branch: 'main', url: 'https://github.com/Naurel1467/youtube-minikube.git'
    }
    
    stage("sending docker to ansible"){
        sshagent(['ad3e390f-6537-4f11-8e2d-f7de4ea92887']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252'
            sh 'scp  /var/jenkins_home/workspace/pipeline-1/* ubuntu@34.229.159.252:/home/ubuntu/'
        }
        
    }
    stage("Dockerizing"){
        sshagent(['ad3e390f-6537-4f11-8e2d-f7de4ea92887']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 cd /home/ubuntu/'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 sudo docker build -t $JOB_NAME:v1.$BUILD_ID . '
        }
        
    }
    stage("Tagging Docker-Image") {
         sshagent(['ad3e390f-6537-4f11-8e2d-f7de4ea92887']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 cd /home/ubuntu/'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 sudo docker tag $JOB_NAME:v1.$BUILD_ID naurel1467/$JOB_NAME:v1.$BUILD_ID'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 sudo docker tag $JOB_NAME:v1.$BUILD_ID naurel1467/$JOB_NAME:latest'
        
        }
    }
}
