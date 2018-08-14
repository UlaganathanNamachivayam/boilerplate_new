pipeline {
  environment {
    registry = "coolbud/playground"
    registryCredential = 'playground_docker'
    dockerImage = ''
  }
  
  agent any
  
  stages {
    
    stage('Checkout') {
      steps {
        git "${git_url}"
      }
    }
    
    stage('BuildingImage') {
      steps{
        script {
           dockerImage = docker.build registry + ":$BUILD_NUMBER"
          dockerImage.inside {
             sh 'cp -pr sample.sh /sample.sh && bash /.sample.sh'
          }
        }
      }
    }
    
    stage('PushingImage') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
      stage('DeployingImage') {
        steps{
          script {
            dockerImage.pull()
          }
      }
    }

  }
 }

