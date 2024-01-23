pipeline {
  agent any
  stages {
    stage('param') {
      steps {
        sleep 1
      }
    }

    stage('') {
      steps {
        xcodeBuild(allowFailingBuildResults: true)
      }
    }

  }
}