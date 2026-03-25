# Use a lightweight Ubuntu base
FROM ubuntu:22.04

# Install dependencies required by the Bitwarden script
RUN apt-get update && apt-get install -y \
    curl \
    docker.io \
    docker-compose \
    gosu \
    && rm -rf /var/lib/apt/lists/*

# 1. Create the dedicated 'bitwarden' user (UID 1000 is standard)
RUN groupadd -g 1000 bitwarden && \
    useradd -m -u 1000 -g bitwarden -s /bin/bash bitwarden

# 2. Set up the application directory
RUN mkdir -p /opt/bitwarden && chown bitwarden:bitwarden /opt/bitwarden

# 3. Download the official Bitwarden setup script as the bitwarden user
USER bitwarden
WORKDIR /opt/bitwarden
RUN curl -Lso bitwarden.sh https://go.btwrdn.co/bw-sh && chmod +x bitwarden.sh

# 4. Expose the volume for persistent data (bwdata)
VOLUME /opt/bitwarden/bwdata

# This container acts as a wrapper for the bitwarden management script
ENTRYPOINT ["./bitwarden.sh"]
