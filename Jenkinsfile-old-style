node {
   stage('Sync') { // for display purposes
      git 'https://github.com/ssmythe/demo_pipeline_jenkins_and_docker.git'
   }
   stage('Build') {
      sh "bash ./build.sh"
   }
   stage('SmokeTest') {
      sh "bash ./smoke_test.sh"
   }
   stage('Stage') {
      sh "bash ./stage_deploy.sh"
      timeout(time: 60, unit: 'SECONDS') {
          input 'Deploy to Production?'
      }
      sh "bash ./stage_cleanup.sh"
   }
   stage('Prod') {
      sh "bash ./prod_deploy.sh"
   }
}
