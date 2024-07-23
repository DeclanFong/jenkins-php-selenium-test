pipeline {
    agent none
    stages {
        stage('Integration Test') {
            parallel {
                stage('Deploy') {
                    agent any
                    steps {
                        script {
                            try {
                                sh 'chmod +x ./jenkins/scripts/deploy.sh'
                                sh './jenkins/scripts/deploy.sh'
                                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                            } catch (Exception e) {
                                error "Deployment failed: ${e.message}"
                            } finally {
                                sh 'chmod +x ./jenkins/scripts/kill.sh'
                                sh './jenkins/scripts/kill.sh'
                            }
                        }
                    }
                }
                stage('Headless Browser Test') {
                    agent {
                        docker {
                            image 'maven:3-alpine'
                            args '-v /root/.m2:/root/.m2'
                        }
                    }
                    steps {
                        script {
                            try {
                                sh 'mvn -B -DskipTests clean package'
                                sh 'mvn test'
                            } catch (Exception e) {
                                error "Headless Browser Test failed: ${e.message}"
                            }
                        }
                    }
                    post {
                        always {
                            junit 'target/surefire-reports/*.xml'
                        }
                    }
                }
            }
        }
    }
}
