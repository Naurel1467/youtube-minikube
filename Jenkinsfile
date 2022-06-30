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
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 docker build -t $JOB_NAME:v1.$BUILD_ID . '
        }
        
    }
    stage("Tagging Docker-Image") {
         sshagent(['ad3e390f-6537-4f11-8e2d-f7de4ea92887']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 cd /home/ubuntu/'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 docker tag $JOB_NAME:v1.$BUILD_ID naurel1467/$JOB_NAME:v1.$BUILD_ID'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 docker tag $JOB_NAME:v1.$BUILD_ID naurel1467/$JOB_NAME:latest'
        
        }
    }
    stage("pushing docker to docker hub") {
        sshagent(['ad3e390f-6537-4f11-8e2d-f7de4ea92887']) {
        withCredentials([string(credentialsId: 'docker_pass', variable: 'docker_pass')]) {
            sh "ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 docker login --username naurel1467 -p $docker_pass"
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 docker push naurel1467/$JOB_NAME:v1.$BUILD_ID'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@34.229.159.252 docker push naurel1467/$JOB_NAME:latest'
        }
    // some block
    }
    }
    stage("copy files from ansibel to k8s server"){
        sshagent(['kubernetes_jenkins']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.85.142.223'
            sh 'scp  /var/jenkins_home/workspace/pipeline-1/* ubuntu@54.85.142.223:/home/ubuntu/'

        }
}

        

    
}
