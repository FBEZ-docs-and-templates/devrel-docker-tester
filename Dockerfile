# Use Ubuntu base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Build-time arguments for Git identity and architecture
ARG GIT_USER="Your Name"
ARG GIT_EMAIL="you@example.com"
ARG ARCH="arm64"

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Download and install Hugo Extended based on architecture
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.125.7/hugo_extended_0.125.7_linux-${ARCH}.tar.gz -o hugo.tar.gz && \
    tar -xzf hugo.tar.gz && \
    mv hugo /usr/local/bin/hugo && \
    rm hugo.tar.gz

# Set Git config globally
RUN git config --global user.name "$GIT_USER" && \
    git config --global user.email "$GIT_EMAIL"

# Default working directory
WORKDIR /workspace/developer-portal
