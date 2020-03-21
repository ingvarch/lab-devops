node {
    stage('Checkout') {
        checkout scm
    }
    try{
        stage('Tests') {
            sh 'pip install flask pytest'
            sh 'pytest test_status200.py'
        }
    }
    catch(e){
        throw e
    }
    stage('Docker-build'){
        docker.withRegistry('', 'docker_registry') {
            docker.build("ingvarch/lab-devops:${env.BUILD_NUMBER}")
            docker.push()
        }
    }
}
