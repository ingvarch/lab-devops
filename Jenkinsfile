node {
    stage('Checkout') {
        checkout scm
    }
    try{
        stage('Tests') {
            docker.image('python:3.8-alpine').inside('-u 0:0') {
                sh 'pip install pytest flask'
                sh 'pytest --verbose --junit-xml test-reports/results.xml'
            }
        }
    }
    catch(e){
        throw e
    }
    finally {
        junit allowEmptyResults: true, testResults: 'test-reports/results.xml', fingerprint: true
    }
    stage('Docker-build'){
        docker.withRegistry('', 'docker_registry') {
            def devopsLab = docker.build("ingvarch/lab-devops:${env.BUILD_NUMBER}")
            devopsLab.push()
            devopsLab.push('latest')
        }
    }
}
