node {

    withMaven(maven:'maven') {

        stage('Checkout') {
            git url: 'https://github.com/habsh/microservice1.git', credentialsId: 'githubnew', branch: 'master'
        }
        stage('Build') {
            sh 'mvn clean install'

            def pom = readMavenPom file:'pom.xml'
            print pom.version
            env.version = pom.version
        }
        stage('Image') {
            dir ('account-service') {
                def app = docker.build "habsh/account-service:${env.version}"
				docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
					app.push()
					}
            }
        }
        stage ('Run') {
            //docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
			docker.image("habsh/account-service:${env.version}").run('-p 2222:2222 -h account --name account')
			//} //--link discovery'
		}

        stage ('Final') {
           // build job: 'customer-service-pipeline', wait: false
        }      

    }

	}
/*pipeline {
    agent any
    
	stages {
        stage('Checkout') {
           steps { 
				git url: 'https://github.com/habsh/microservice1.git', credentialsId: 'habsh', branch: 'master'
		   }
        }

        stage('Build') {
			steps {
				bat 'cd ./account-service'
				bat 'mvn clean install'
				
				}
			}       
		}
	}
*/