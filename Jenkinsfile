pipeline {
    agent any
    
    options {
        disableConcurrentBuilds()
        timestamps()
    }



    parameters {
        booleanParam(name: 'SKIP_PUBLISH_IMAGE', defaultValue: false)
    }



    stages {
        stage ('Docker Build'){
            steps{
                sh "docker build -t routeg/website:${env.BUILD_NUMBER} ."
            }
        }

        stage ('Docker push'){
             when {
                expression {
                    return params.SKIP_PUBLISH_IMAGE == false;
                }
            }
        
            
            steps{
                withDockerRegistry(url: 'https://index.docker.io/v1/', credentialsId: 'dockerhub-registry') {
                    sh 'docker push routeg/java-sample:${env.BUILD_NUMBER}'
                }
            }
        }    
    } 

}    


