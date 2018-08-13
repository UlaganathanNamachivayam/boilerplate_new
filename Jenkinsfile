pipeline {
  environment {
    registry = “coolbud/playground”
    registryCredential = ‘playground_docker’
    dockerImage = ‘’
  }
  agent any
  stages {
    stage(‘Checkout’) {
      steps {
        git "${git_url}"
      }
    }
    stage(‘BuildingImage’) {
      steps{
        script {
          def dockerImage = docker.build registry + “:${BUILD_NUMBER}”
        }
      }
    }
    stage(‘DeployingImage’) {
      steps{
        script {
          docker.withRegistry( ‘’, registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}
