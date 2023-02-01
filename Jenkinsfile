pipeline {
    agent any
	environment {
	dockerImage = ''
	registryCredential = 'dockerhubid'
	registry = "keyspaceitsmeet29/keyapps"
	}
    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/keyspaceits/docker.git']])
            }
        }
		stage('ImageBuild') {
		 steps {
		  script {
		      dockerImage = docker.build registry + ":$BUILD_NUMBER"
		  }
		 
		 }
		}
		stage('PublishImage') {
		  steps{
		   script {
		    docker.withRegistry( '', registryCredential ) {
		    dockerImage.push()
		     }
		   
		   }
		  
		  }
		
		}
		stage('Cleaning Up Image') {
		steps {
		    sh "docker rmi $registry:$BUILD_NUMBER"
		  }
		}
    }
}
