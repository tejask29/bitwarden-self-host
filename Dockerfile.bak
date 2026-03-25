# Example Dockerfile to create a management node for Bitwarden
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl docker.io docker-compose
WORKDIR /opt/bitwarden

# Download the management script
RUN curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh && chmod +x bitwarden.sh

# The script is interactive, so further steps are usually handled at runtime
ENTRYPOINT ["./bitwarden.sh"]
