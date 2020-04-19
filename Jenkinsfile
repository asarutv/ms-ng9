node {
    
    stage ("Git clone"){
        
        git 'https://github.com/asarutv/ms-ng9'
    }
    
    stage ("building docker image"){
        
      sh '''
        docker build -t ng-netflix .
        docker images
        
      '''
    }
    
    stage ("Taging docker Image"){
      sh 'docker login -u Chelibane80 -p Tanina2008 harbor.asaru.info' 
      sh 'docker tag ng-netfix:latest harbor.asaru.info/front-01/ng-netflix:0.0.1'
    }
    
    stage("Sending Image to Harbor"){

      sh 'docker push harbor.asaru.info/front-01/ng-netflix:0.0.1'
      sh 'docker image rm ng-netflix'
    }
}

