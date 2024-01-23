pipeline {
  agent any
  stages {
    stage('param') {
      steps {
        sleep 1
      }
    }

    stage('xcode') {
      steps {
        xcodeBuild(allowFailingBuildResults: true, cleanBeforeBuild: true, copyProvisioningProfile: true)
      }
    }

  }
}