# Bitwarden Self-Host on Railway

Deploy official Bitwarden on Railway using the single-container image backed by PostgreSQL.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/new?template=https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME)

## Required Environment Variables

Before deploying, make sure to set the following variables in Railway:

| Variable | Description |
| :--- | :--- |
| `POSTGRES_PASSWORD` | Secure database password |
| `BW_INSTALLATION_ID` | Host Installation ID from [bitwarden.com/host](https://bitwarden.com/host/) |
| `BW_INSTALLATION_KEY` | Host Installation Key from [bitwarden.com/host](https://bitwarden.com/host/) |

## Persistent Storage
Ensure a Railway Volume is attached to the Bitwarden service mounted at `/etc/bitwarden`.