#!/bin/bash 
pipeline {
  agent any

  stages {
    stage('Run Script') {
      steps {
        sh 'bash build.sh'
      }
    }
  }

  post {
    always {
      mail to: 'keerthanavelusamy2001@gmail.com',
           subject: "Build ${currentBuild.fullDisplayName} - ${currentBuild.currentResult}",
           body: "Build finished with status: ${currentBuild.currentResult}\nCheck the build details here: ${env.BUILD_URL}"
    }
  }
}
