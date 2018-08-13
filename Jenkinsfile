pipeline {
	agent { dockerfile true }
	
	stages {
		stage('Checkout') {
		 steps {	
			git branch: 'master',
			credentialsId: 'gitaccess',															
			url: "${git_url}"
		 }
		}
		stage('Building') {
		 steps{  
		  script { 	
			  def customImage = docker.build("coolbud/playground")
			echo 'Building the project'
			customImage.inside{
			sh('cp sample.sh /sample.sh')
			}
			  customImage.push(coolbud/playground:"${userid}-${env.BUILD_NUMBER}")
		 }
	   }
    }
  }	
}
