FROM ubuntu:latest

# Prevent interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install Python, pip, git, and certs
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-distutils \
    git \
    ca-certificates \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Upgrade pip safely
RUN python3 -m pip install --upgrade pip setuptools wheel

# Install PyYAML
RUN pip3 install --no-cache-dir PyYAML

# Copy scripts
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint is executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
