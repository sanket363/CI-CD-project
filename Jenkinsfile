pipeline {
    agent { label 'node-agent' }
    
    stages{
        stage('Code'){
            steps{
                git url: 'https://github.com/sanket363/deployed-end-to-end-application', branch: 'main' 
            }
        }
        stage('Build and Test'){
            steps{
                sh 'docker build . -t snaket2628/todo-app'
            }
        }
        stage('Push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	     sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                 sh 'docker push snaket2628/todo-app:latest'
                }
            }
        }
        stage('Deploy'){
            steps{
                sh "kubectl apply -f deploy.yaml -n my-namespace"
            }
        }
    }
}
