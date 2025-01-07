# Use an official lightweight image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    shadowsocks-libev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose Shadowsocks port
EXPOSE <port>

# Entry point for the container
ENTRYPOINT ["ss-server"]
CMD ["-s", "0.0.0.0", "-p", "<port>", "-k", "<password>", "-m", "chacha20-ietf-poly1305"]
