FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-distutils \
    git \
    ca-certificates \
&& apt-get clean \
&& rm -rf /ver/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip setuptools wheel

RUN pip3 install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]