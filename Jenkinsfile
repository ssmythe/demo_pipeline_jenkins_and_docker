pipeline {
    agent {
        node {
            label 'master'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh "bash ./build.sh"
            }
        }
        stage('SmokeTest') {
            steps {
                sh "bash ./smoke_test.sh"
            }
        }
        stage('Stage') {
            steps {
                sh "bash ./stage_deploy.sh"
                timeout(time: 30, unit: 'SECONDS') {
                  input 'Deploy to Production?'
                }
                sh "bash ./stage_cleanup.sh"
            }
        }
        stage('Prod') {
            steps {
                sh "bash ./prod_deploy.sh"
            }
        }
    }
}
