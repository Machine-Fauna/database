# Database for local development

## Syntax

### Create db from scratch
```
make db-<service-name>
```
Full list of services see in `Makefile`

## Example:

```
cp .env.example .env
make start
make db
```