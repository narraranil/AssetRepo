pipeline {
  agent any
  stages {
    stage('Initialize') {
      steps {
        sh 'chmod -R 777 ${WORKSPACE}'
      }
    }

    stage('Copy Packages from Git') {
      steps {
        sh '${WORKSPACE}/CopyPackageToVM.sh'
      }
    }

    stage('Create Customer docker files') {
      steps {
        sh "${MSR_TARGET_DOCKER}/is_container.sh createPackageDockerfile -Dimage.name=is:msr -Dpackage.list=Customers -Dfile.name=CustomerMSR"
        echo 'Customers package docker file created'
      }
    }

    stage('Build Customer Image') {
      steps {
        sh "${MSR_TARGET_DOCKER}/is_container.sh buildPackage -Dimage.name=is:${CustomerTag} -Dfile.name=CustomerMSR"
        echo 'Customers MSR image built successfully'
      }
    }

    stage('Push Customer image to docker registry') {
      steps {
        sh '${MSR_TARGET_DOCKER}/is_container.sh pushImage -Duser=${DockerRegistryUser} -Dpassword=${DockerRegistryPassword} -Dserver=${DockerRegistryUrl} -Drepository.name=${DockerRepositoryName} -Dimage.name=is:${CustomerTag}'
        echo 'Uploaded Customers MSR image built successfully'
      }
    }
    stage ('UnitTest') {
	  
 			// Ant build step
 			steps{
			
 				sh "ant -buildfile /var/lib/jenkins/workspace/AccelerateMSRCustomerImage/assets/IS/Tests/AirlineDemoTestSuiteExecutor/run-composite-runner.xml -DwebMethods.integrationServer.ssl=false -DwebMethods.home=/opt/softwareag -DwebMethods.test.setup.profile.mode=NONE -DwebMethods.integrationServer.name=localhost -DwebMethods.test.setup.location=/var/lib/jenkins/workspace/AccelerateMSRCustomerImage/assets/IS/Tests/AirlineDemoTests -DwebMethods.test.setup.external.classpath.layout=${env} -DwebMethods.integrationServer.port=5555 -DwebMethods.test.scope.packages=UnitTests -DwebMethods.integrationServer.userid=Administrator -DwebMethods.test.profile.result.location=/var/lib/jenkins/workspace/AccelerateMSRCustomerImage/assets/IS/Tests/AirlineDemoTestSuiteExecutor/test/reports/ -DwebMethods.integrationServer.password=manage composite-runner-all-tests" 
      	publishHTML([allowMissing: true, alwaysLinkToLastBuild: false, keepAll: true, reportDir: '/var/lib/jenkins/workspace/AccelerateMSRCustomerImage/assets/IS/Tests/AirlineDemoTestSuiteExecutor/test/reports/html', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
	}
	
}
  }
}