{{/*
Expand the name of the chart.
*/}}
{{- define "penpot.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "penpot.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "penpot.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "penpot.labels" -}}
helm.sh/chart: {{ include "penpot.chart" . }}
{{ include "penpot.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "penpot.selectorLabels" -}}
app.kubernetes.io/name: {{ include "penpot.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "penpot.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "penpot.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "penpot.flags" -}}
{{- $flags := .Values.config.flags }}
{{- if .Values.config.smtp.enabled }}
{{- $flags = printf "%s enable-smtp" $flags }}
{{- else }}
{{- $flags = printf "%s disable-smtp" $flags }}
{{- end }}
{{- if .Values.config.auth.local.enabled }}
{{- $flags = printf "%s enable-login" $flags }}
{{- else }}
{{- $flags = printf "%s disable-login" $flags }}
{{- end }}
{{- if .Values.config.auth.registration.enabled }}
{{- $flags = printf "%s enable-registration" $flags }}
{{- else }}
{{- $flags = printf "%s disable-registration" $flags }}
{{- end }}
{{- if .Values.config.auth.google.enabled }}
{{- $flags = printf "%s enable-login-with-google" $flags }}
{{- end }}
{{- if .Values.config.auth.github.enabled }}
{{- $flags = printf "%s enable-login-with-github" $flags }}
{{- end }}
{{- if .Values.config.auth.gitlab.enabled }}
{{- $flags = printf "%s enable-login-with-gitlab" $flags }}
{{- end }}
{{- if .Values.config.auth.oidc.enabled }}
{{- $flags = printf "%s enable-login-with-oidc" $flags }}
{{- end }}
{{- if .Values.config.auth.ldap.enabled }}
{{- $flags = printf "%s enable-login-with-ldap" $flags }}
{{- end }}
{{- $flags | trim }}
{{- end }}
