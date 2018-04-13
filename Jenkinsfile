#!/usr/bin/groovy
@Library('github.com/stakater/fabric8-pipeline-library@chart-func')

def dummy = ""

toolsNode(toolsImage: 'stakater/pipeline-tools:1.2.0') {
    container(name: 'tools') {
        stage('Checkout') {
            checkout scm
        }

        prepareAndUploadChart {
            chartName = "chartmuseum"
        }

        prepareAndUploadChart {
            chartName = "chartmuseum-storage"
        }
    }
}