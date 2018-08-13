pipeline {
  environment {
    registry = “coolbud/playground”
    registryCredential = ‘playground_docker’
    dockerImage = ‘’
  }
  agent any
  stages {
    stage(‘Cloning Git’) {
      steps {
        git "${git_url}"
      }
    }
    stage(‘Building image’) {
      steps{
        script {
          dockerImage = docker.build registry + “:$BUILD_NUMBER”
        }
      }
    }
    stage(‘Deploy Image’) {
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
