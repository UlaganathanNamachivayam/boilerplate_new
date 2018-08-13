pipeline {
	agent { dockerfile true }
	environment {
		PRO_WORKSPACE = ""	
	}

	stages {
		stage('Checkout') {
		 steps {	
			git branch: 'master',
			credentialsId: 'gitaccess',															
			url: "${git_url}"
			script {
                            PRO_WORKSPACE = WORKSPACE
                        }
		 }
		}
		stage('Building') {
		 steps{  
		  script { 	
			PRO_WORKSPACE = WORKSPACE
			def customImage = docker.build("coolbud/playground")
			echo 'Building the project'
			customImage.inside{
			sh('sample.sh')
			}
			  customImage.push("${userid}-${env.BUILD_NUMBER}")
		 }
	   }
    }
  }	
}

