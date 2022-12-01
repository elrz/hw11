pipeline {
    agent any
    
    options {
        disableConcurrentBuilds()
        timestamps()
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-registry')
    }



    parameters {
        booleanParam(name: 'SKIP_PUBLISH_IMAGE', defaultValue: false)
    }



    stages {
        stage ('Docker Build'){
            steps{
                sh "docker build -t routeg/website:${env.BUILD_NUMBER}.${env.GIT_COMMIT} ."
            }
        }

        stage("Login"){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }


        stage ('Docker push'){
            when {
                expression {
                    return params.SKIP_PUBLISH_IMAGE == false;
                }
            }
        
            
            steps{
                 
                 sh "docker push routeg/website:${env.BUILD_NUMBER}"
            }
            
        }    
    } 

}    


