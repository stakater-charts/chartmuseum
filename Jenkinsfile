#!/usr/bin/groovy
@Library('github.com/stakater/fabric8-pipeline-library@basic-auth-cm')

String chartMuseumPackageName = ""
String chartMuseumStoragePackageName = ""
String chartMuseumChartName = "chartmuseum"
String chartMuseumStorageChartName = "chartmuseum-storage"

toolsNode(toolsImage: 'stakater/pipeline-tools:1.2.0') {
    container(name: 'tools') {
        def helm = new io.stakater.charts.Helm()
        def chartManager = new io.stakater.charts.ChartManager()
        stage('Checkout') {
            checkout scm
        }
        
        stage('Init Helm') {
            helm.init(true)
        }

        stage('Prepare Chart') {
            helm.lint(WORKSPACE, chartMuseumChartName)
            chartMuseumPackageName = helm.package(WORKSPACE, chartMuseumChartName)

            helm.lint(WORKSPACE, chartMuseumStorageChartName)
            chartMuseumStoragePackageName = helm.package(WORKSPACE, chartMuseumStorageChartName)
        }

        stage('Upload Chart') {
            chartManager.uploadToChartMuseum(WORKSPACE, chartMuseumChartName, chartMuseumPackageName, env.CHARTMUSEUM_USERNAME, env.CHARTMUSEUM_PASSWORD)
            chartManager.uploadToChartMuseum(WORKSPACE, chartMuseumStorageChartName, chartMuseumStoragePackageName, env.CHARTMUSEUM_USERNAME, env.CHARTMUSEUM_PASSWORD)
        }
    }
}
