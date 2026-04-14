{{- define "customer-registration.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "customer-registration.fullname" -}}
{{- if .Values.fullNameOverride -}}
{{- .Values.fullNameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "customer-registration.name" . -}}
{{- end -}}
{{- end -}}

{{- define "customer-registration.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "customer-registration.labels" -}}
helm.sh/chart: {{ include "customer-registration.chart" . }}
app.kubernetes.io/name: {{ include "customer-registration.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "customer-registration.selectorLabels" -}}
app.kubernetes.io/name: {{ include "customer-registration.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
