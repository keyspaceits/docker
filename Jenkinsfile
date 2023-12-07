def dockerImageTag = "projectkspace/kapps:${BUILD_NUMBER}"

node ('docker-agent') {
   
    stage('Checkout') {
        
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/keyspaceits/docker.git']])
       
    }
    stage('DockerImageBuild') {
        def dockerImage = docker.build(dockerImageTag)
      
    }
    stage('Push to DockerHUB') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-registry') {
        def dockerImage = docker.image(dockerImageTag)
        dockerImage.push()
     }
    }
}
