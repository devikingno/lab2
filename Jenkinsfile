pipeline {
    agent any
    environment {
        PATH = "/root/.nvm/versions/node/v14.17.2/bin:$PATH"
    }
    stages {
        stage('git clone'){
            git branch: 'develop', credentialsId: 'Gitlab-ssh', url: 'git@git.vmo.dev:global/vmo-devops-internal/fresher-project/minhha-project-nestjs.git'
        }
        stage('Pull images and configure') {
            steps {
                sh 'sudo docker pull qzpm0645/lab2-app:v2'
                sh 'sudo docker pull qzpm0645/lab2-app-db:v2'
                sh 'cp src/config.ts.example src/config.ts'
                sh 'cp ormconfig.json.example ormconfig.json'
                withCredentials([usernamePassword(credentialsId: 'jens', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "sed -i 's/your-mysql-username/${USER}/; s/your-mysql-password/${PASS}/' ormconfig.json"
                }
                sh 'cat ormconfig.json'
                sh 'cp .env.example .env'
            }
        }
        stage('Deploy') {
            steps {
                    sh 'cp docker-compose.yaml.deploy-example docker-compose.yaml'
                    sh 'sudo docker-compose up -d'
            }
        }
    }
}