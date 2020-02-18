pipeline{
    agent any
    stages{  

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarQube Scanner';
                    withSonarQubeEnv('SonarQube') {
                        // -Dsonar.branch.name=$BRANCH_NAME
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=Bristom-Dashboard -Dsonar.sources=. -Dsonar.host.url=https://sonar.supera.com.br -Dsonar.login=b5bb0bb129f94837f02bcfd2a1e1b2ec11b5932d"
                    }
                }
            }
        }

        stage('Build-image'){
            steps{
                script{
                    docker.build ("geovanne123/strapi:latest")
                }
            }
        }
        
        // stage('Push-image'){       
        //     steps {
        //         script {
        //             withDockerRegistry(credentialsId: 'docker-login-hub', url: 'https://hub.docker.com'){
        //                     sh 'docker push geovanne123/strapi:latest'
        //             }
        //         }   
        //     }
        // }

        

        // stage('JUnit Test'){
        //     agent {
        //         docker {
        //             image 'ubuntu'
        //         }
        //     }
        //     steps {
        //         sh 'ls -la'
        //         // withEnv(["HOME=${env.WORKSPACE}"]) {
        //         //     sh 'pip install --user -r requirements.txt'
        //         //     sh 'pytest --verbose --junitxml=test-reports/results.xml tests.py'
        //         // }
        //     }
        //     // post {
        //     //     // always {
        //     //     //     junit 'test-reports/*.xml'
        //     //     // }
        //     //     success {
        //     //         updateGitlabCommitStatus name: 'JUnit Test', state: 'success'
        //     //         sh "curl -s -X POST https://api.telegram.org/bot919593462:AAFntrAii7yP3KiMza3wpx_r2OfTIAhPv_A/sendMessage -d chat_id=245617510 -d text='✅ Etapa JUnit Test concluída com sucesso!'"
        //     //     }
        //     //     failure {
        //     //         updateGitlabCommitStatus name: 'JUnit Test', state: 'failed'
        //     //         sh "curl -s -X POST https://api.telegram.org/bot919593462:AAFntrAii7yP3KiMza3wpx_r2OfTIAhPv_A/sendMessage -d chat_id=245617510 -d text='Etapa JUnit Test terminada com falha! Pipeline finalizado por erro!'"
        //     //     }
        //     // }
        // }

        stage('Deploy server'){
            steps{
                script{
                    sh 'ssh -tt -o StrictHostKeyChecking=no jenkins@54.159.233.207 "cd /home/jenkins/strapi/ &&  git pull origin master && docker-compose up -d"'
                }
            }
        } 
        
    }
}
