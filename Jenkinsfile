#!/usr/bin/groovy
@Library('github.com/stakater/fabric8-pipeline-library@master')

String chartMuseumPackageName = ""
String chartMuseumStoragePackageName = ""
String chartMuseumChartName = "chartmuseum"
String chartMuseumStorageChartName = "chartmuseum-storage"

clientsNode(clientsImage: 'stakater/kops-ansible:helm-bundle') {
    container(name: 'clients') {
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
            chartManager.uploadToChartMuseum(WORKSPACE, chartMuseumChartName, chartMuseumPackageName)
            chartManager.uploadToChartMuseum(WORKSPACE, chartMuseumStorageChartName, chartMuseumStoragePackageName)
        }
    }
}
