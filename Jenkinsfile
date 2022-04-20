pipeline {
    agent any
    environment {
        PATH = "/root/.nvm/versions/node/v14.17.2/bin:$PATH"
        DATABASE=nestjsrealworld
        USER=user
        PASS=pass
        DB_IMAGES_TAG=10.5.8
        DB_PORT=3306
        APP_PORT=3000
        NETWORKS=test
    }
    stages {
		stage('Git clone'){
			steps{
				echo 'Clone project'
                sh 'whoami'
                sh 'pwd'
                sh 'ls'
                sh 'node -v'
			}
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