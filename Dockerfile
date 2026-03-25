# We use the 'latest' tag instead of the SHA to ensure we get the manifest with amd64 support
FROM --platform=linux/amd64 ghcr.io/bitwarden/self-host:latest

# The standard self-host image typically listens on port 8080 or 80
EXPOSE 8080