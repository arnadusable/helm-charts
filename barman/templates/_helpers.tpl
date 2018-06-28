{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "barman.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "barman.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "barman.servers.configmap.fullname" -}}
{{- $fullname := include "barman.fullname" . -}}
{{- printf "%s-%s" $fullname "directory" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "barman.general.configmap.fullname" -}}
{{- $fullname := include "barman.fullname" . -}}
{{- printf "%s-%s" $fullname "general" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "postgresql.fullname" -}}
{{- $serviceName := default "proxy" .Values.postgresql.nameOverride -}}
{{- $name := default .Chart.Name .Values.postgresql.proxy.nameOverride -}}
{{- printf "%s-%s-%s" .Release.Name  $serviceName $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
