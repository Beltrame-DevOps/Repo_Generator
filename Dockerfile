FROM ubuntu:latest


# Install Python, pip, git, and certs
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git 


# Install PyYAML
RUN pip3 install PyYAML

# Copy scripts
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
