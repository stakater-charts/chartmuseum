{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "chartmuseum-storage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "chartmuseum-storage.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "chartmuseum-storage.labels.stakater" -}}
app: {{ template "chartmuseum-storage.name" . }}
group: {{ .Values.chartmuseumStorage.labels.group }}
version: "{{ .Values.chartmuseumStorage.labels.version }}"
provider: {{ .Values.chartmuseumStorage.labels.provider }}
{{- end -}}

{{- define "chartmuseum-storage.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
