| Service | Ports | Used For | OSS Compliant? |
|---------|-------|----------|----------------|
| Librechat UI + API | 3080 | Librechat | OK |
| Librechat Admin Panel | 3000 | Librechat |  OK |
| MongoDB | 27017 | Librechat | KO |
| Meilisearch | 7700 | Librechat | KO |
| Librechat RAG API | 8000 | Librechat | OK |
| Redis | 6379 | Langfuse | KO |
| MinIO | 9000, 9001 | Langfuse | KO |
| Clickhouse | 8123 | Langfuse | OK |
| PostgreSQL (Vector) | 5432 | Langfuse + Librechat + LiteLLM | OK |
| Langfuse UI | 3210 | Langfuse | OK |
| Langfuse Worker | 3333 | Langfuse | OK |
| LiteLLM | 4000 | LiteLLM | OK |

TODO: Keycloak OIDC

Then Langfuse integration with LiteLLM

Langfuse Integration with LibreChat

Keycloak HTTPS
Librechat HTTPs aswell

Create Localhost CA PKI for services

