{{- define "customer-registration-db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "customer-registration-db.fullname" -}}
{{- if .Values.fullNameOverride -}}
{{- .Values.fullNameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "customer-registration-db.name" . -}}
{{- end -}}
{{- end -}}

{{- define "customer-registration-db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "customer-registration-db.labels" -}}
helm.sh/chart: {{ include "customer-registration-db.chart" . }}
app.kubernetes.io/name: {{ include "customer-registration-db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "customer-registration-db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "customer-registration-db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
