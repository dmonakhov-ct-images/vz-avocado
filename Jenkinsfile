pipeline {
  agent { label 'docker' }
  options {
    timeout(time: 1, unit: 'HOURS')
  }
  parameters {
    string(name: 'REGISTRY', defaultValue: 'dev.qa.sw.ru:30500', description: 'image registry to push')
    string(name: 'IMG_NAME', defaultValue: 'vz-avocado', description: 'image name')
    string(name: 'IMG_TAG', defaultValue: 'latest', description: 'image tag')
  }
  stages {
    // TODO: Add auto-tests for image
    stage('build and push') {
      steps {
	container('docker') {
          sh 'echo reg:$REGISTRY name:$IMG_NAME tag:$IMG_TAG'
	  sh 'docker build --rm -t $REGISTRY/$IMG_NAME:$IMG_TAG . -f Dockerfile'
	  sh 'docker push $REGISTRY/$IMG_NAME:$IMG_TAG'
	  }
      }
    }
  }
}
