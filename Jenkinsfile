pipeline {
    agent any
    
    options {
        disableConcurrentBuilds()
        timestamps()
    }

    stages {
        stage ('Docker Build'){
            steps{
                sh "docker build -t routeg/website:${env.BUILD_NUMBER} ."
            }
        }
    }       
}    


