pipeline {
	agent { dockerfile true }
	
	stages {
		stage('Checkout') {
		 steps {	
			git branch: 'master',
			credentialsId: 'gitaccess',															
			url: "${git_url}",
		   script { 	
			  def customImage = docker.build("coolbud/playground")
			echo 'Building the project'
			customImage.inside{
			sh('sample.sh')
			}
			  customImage.push("${userid}-${env.BUILD_NUMBER}")
			}
		   }
		}
		stage('Testing') {
		 steps{  
		     shell ('echo "Image build and pushed to docker repository"')
			 
	   }
    }
  }	
}
