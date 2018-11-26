{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "chartmuseum.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "quoted-name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | quote -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "chartmuseum.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "chartmuseum.labels.selector" -}}
app: {{ template "chartmuseum.name" . }}
group: {{ .Values.chartmuseum.labels.group }}
provider: {{ .Values.chartmuseum.labels.provider }}
{{- end -}}

{{- define "chartmuseum.labels.stakater" -}}
{{ template "chartmuseum.labels.selector" . }}
version: "{{ .Values.chartmuseum.labels.version }}"
{{- end -}}

{{- define "chartmuseum.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
