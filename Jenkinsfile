pipeline{
    agent any
    stages{  

        // stage('SonarQube Analysis') {
        //     steps {
        //         script {
        //             def scannerHome = tool 'SonarQube Scanner';
        //             withSonarQubeEnv('SonarQube') {
        //                 // -Dsonar.branch.name=$BRANCH_NAME
        //                 sh "whoami"
        //                 sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=Bristom-Dashboard -Dsonar.sources=. -Dsonar.host.url=https://sonar.supera.com.br -Dsonar.login=b5bb0bb129f94837f02bcfd2a1e1b2ec11b5932d"
        //             }
        //         }
        //     }
        // }

        stage('Build-image'){
            steps{
                script{
                    docker.build ("geovanne123/strapi:latest")
                }
            }
        }
        
        stage('Push-image'){       
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-login-hub', url: 'https://registry.supera.com.br'){
                            sh 'docker push geovanne123/strapi:latest'
                    }
                }   
            }
        }

        

        stage('Deploy server'){
            steps{
                script{
                    sh 'ssh -tt -o StrictHostKeyChecking=no jenkins@192.168.4.168 "ls -la"'
                }
            }
        } 
        
    }
}
