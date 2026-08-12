# Use a lightweight Ubuntu base
FROM ubuntu:22.04

# Prevent interactive prompts during apt installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies required by the Bitwarden script
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gosu \
    && rm -rf /var/lib/apt/lists/*

# 1. Create the dedicated 'bitwarden' user
RUN groupadd -g 1000 bitwarden && \
    useradd -m -u 1000 -g bitwarden -s /bin/bash bitwarden

# 2. Set up the application directory
RUN mkdir -p /opt/bitwarden && chown bitwarden:bitwarden /opt/bitwarden

# 3. Download the official Bitwarden setup script as the bitwarden user
USER bitwarden
WORKDIR /opt/bitwarden
RUN curl -Lso bitwarden.sh "https://func.bitwarden.com/api/dl/?app=self-host&platform=linux" && chmod 700 bitwarden.sh && chmod +x bitwarden.sh

# Expose container HTTP port
EXPOSE 8080

# 4. Use explicit bash execution with correct array comma formatting
ENTRYPOINT ["./bitwarden.sh", "start"]