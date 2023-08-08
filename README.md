# penpot

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.19.0](https://img.shields.io/badge/AppVersion-1.19.0-informational?style=flat-square)

A Helm chart for penpot.app

**Homepage:** <https://penpot.app/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Fabian Zach | <fabian.zach@methodpark.de> | <https://github.com/fabianmp> |

## Source Code

* <https://github.com/fabianmp/penpot-helm>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.8.0 |
| https://charts.bitnami.com/bitnami | redis | 17.14.6 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for penpot pod |
| backend.image.pullPolicy | string | `"IfNotPresent"` | penpot backend pull policy |
| backend.image.repository | string | `"penpotapp/backend"` | penpot backend image |
| backend.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| backend.resources | object | `{}` | Resources for backend container |
| config.auth.github.client | string | `""` | OAuth client ID |
| config.auth.github.enabled | bool | `false` | Enable GitHub OAuth provider |
| config.auth.github.secret | string | `""` | OAuth client secret |
| config.auth.gitlab.baseUri | string | `"https://gitlab.com"` | Base URI of GitLab instance |
| config.auth.gitlab.client | string | `""` | OAuth client ID |
| config.auth.gitlab.enabled | bool | `false` | Enable GitLab OAuth provider |
| config.auth.gitlab.secret | string | `""` | OAuth client secret |
| config.auth.google.client | string | `""` | OAuth client ID |
| config.auth.google.enabled | bool | `false` | Enable Google OAuth provider |
| config.auth.google.secret | string | `""` | OAuth client secret |
| config.auth.ldap.attributes.email | string | `"mail"` | LDAP attribute for user e-mail address |
| config.auth.ldap.attributes.fullname | string | `"cn"` | LDAP attribute for user full name |
| config.auth.ldap.attributes.photo | string | `"jpegPhoto"` | LDAP attribute for user photo |
| config.auth.ldap.attributes.username | string | `"uid"` | LDAP attribute for user name |
| config.auth.ldap.baseDN | string | `"ou=people,dc=mycompany,dc=com"` | LDAP base DN |
| config.auth.ldap.bindDN | string | `"cn=admin,dc=mycompany,dc=com"` | LDAP bind DN |
| config.auth.ldap.bindPassword | string | `"password"` | LDAP bind password |
| config.auth.ldap.enabled | bool | `false` | Enable LDAP login |
| config.auth.ldap.host | string | `"localhost"` | LDAP host |
| config.auth.ldap.port | int | `10389` | LDAP port |
| config.auth.ldap.ssl | bool | `false` | Enable SSL for LDAP |
| config.auth.ldap.starttls | bool | `false` | Enable STARTTLS for LDAP |
| config.auth.local.enabled | bool | `true` | Enable login with local user |
| config.auth.oidc.baseUri | string | `""` | Base URI of OAuth provider |
| config.auth.oidc.client | string | `""` | OAuth client ID |
| config.auth.oidc.email | string | `"email"` | Attribute used as user e-mail address |
| config.auth.oidc.enabled | bool | `false` | Enable generic OAuth provider |
| config.auth.oidc.name | string | `"name"` | Attribute used as user name |
| config.auth.oidc.scopes | string | `"openid email profile"` | Default OIDC scopes |
| config.auth.oidc.secret | string | `""` | OAuth client secret |
| config.auth.registration.domainWhitelist | string | `""` | Whitelist for allowed registration domains (empty allows all) |
| config.auth.registration.enabled | bool | `true` | Enable user registration |
| config.externalUrl | string | `"http://localhost"` | External URL of the penpot instance |
| config.flags | string | `""` | Flags passed to penpot frontend and backend |
| config.s3.enabled | bool | `false` | Enable S3 storage backend |
| config.smtp.enabled | bool | `false` | Enable SMTP server |
| config.smtp.from | string | `"no-reply@penpot.app"` | Address used to send e-mails from |
| config.smtp.host | string | `"localhost"` | SMTP host |
| config.smtp.password | string | `""` | SMTP password |
| config.smtp.port | int | `465` | SMTP port |
| config.smtp.replyTo | string | `""` | ReplyTo address (defaults to "from" address) |
| config.smtp.ssl | bool | `false` | Use SSL for SMTP connection |
| config.smtp.tls | bool | `true` | Use TLS for SMTP connection |
| config.smtp.username | string | `""` | SMTP user name |
| config.telemetry | bool | `false` | Send telemetry data |
| config.tenant | string | `"penpot"` | Tenant name |
| exporter.image.pullPolicy | string | `"IfNotPresent"` | penpot exporter pull policy |
| exporter.image.repository | string | `"penpotapp/exporter"` | penpot exporter image |
| exporter.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| exporter.resources | object | `{}` | Resources for exporter container |
| frontend.image.pullPolicy | string | `"IfNotPresent"` | penpot frontend pull policy |
| frontend.image.repository | string | `"penpotapp/frontend"` | penpot frontend image |
| frontend.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| frontend.resources | object | `{}` | Resources for frontend container |
| fullnameOverride | string | `""` | Override full name of this release |
| imagePullSecrets | list | `[]` | Image pull secrets for penpot pod |
| ingress.annotations | object | `{}` | Annotations to be added to ingress |
| ingress.className | string | `""` | Name of the ingress class |
| ingress.enabled | bool | `false` | Enable ingress for penpot |
| ingress.hosts | list | `[{"host":"penpot.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | External hostname for penpot |
| ingress.tls | list | `[]` | TLS configuration for ingress (see [docs](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls)) |
| nameOverride | string | `""` | Override name of this release |
| nodeSelector | object | `{}` | Node selector for penpot pod |
| persistence.enabled | bool | `true` | Enable persistent storage |
| persistence.size | string | `"1Gi"` | Size of PVC for data |
| persistence.storageClass | string | `""` | Name of storage class for data PVC |
| podAnnotations | object | `{}` | Annotations to be added to the penpot pod |
| postgresql.auth.database | string | `"penpot"` | Postgresql database name |
| postgresql.auth.enablePostgresUser | bool | `false` | Enable postgres admin user |
| postgresql.auth.password | string | `"penpot"` | Postgresql database password |
| postgresql.auth.postgresPassword | string | `"postgres"` | Password for postgres admin user |
| postgresql.auth.username | string | `"penpot"` | Postgresql database user |
| postgresql.image.tag | string | `"14.8.0"` | Image to be used for Postgresql (currently 14.x) |
| redis.architecture | string | `"standalone"` | Redis deployment type |
| redis.auth.enabled | bool | `false` | Enable authentication in Redis |
| replicaCount | int | `1` | Number of replicas |
| service.port | int | `80` | Service port for penpot frontend |
| service.type | string | `"ClusterIP"` | Service type for penpot service |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | Tolerations for penpot pod |
