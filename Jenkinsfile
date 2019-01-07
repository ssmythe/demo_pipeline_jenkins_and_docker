pipeline {
    agent {
        node {
            label 'master'
        }
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello!'   
            }
        }
/*--
        stage('Sync') {
            steps {
                git 'https://github.com/ssmythe/demo_pipeline_jenkins_and_docker.git'
            }
        }
--*/
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
                timeout(time: 60, unit: 'SECONDS') {
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
