pipeline {
	agent { dockerfile true }
	environment {
		PRO_WORKSPACE = ""	
	}

	stages {
		stage('Checkout and Build') {
		 steps {	
			checkout scm
		}
		stage('Testing') {
		 steps{  
		    script { 	
			PRO_WORKSPACE = WORKSPACE
			def customImage = docker.build("coolbud/playground")
			echo 'Building the project'
			customImage.inside{
			sh('cp sample.sh /sample.sh && sh ./sample.sh')
			}
			  customImage.push("${userid}-${env.BUILD_NUMBER}")
			 }
		  }
	   }
    }
  }	
}

