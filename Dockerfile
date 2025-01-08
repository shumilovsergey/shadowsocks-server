FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    shadowsocks-libev iptables \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY reset_shadowsocks.sh /usr/local/bin/reset_shadowsocks.sh
RUN chmod +x /usr/local/bin/reset_shadowsocks.sh

EXPOSE 8388

ENTRYPOINT ["ss-server"]
CMD ["-s", "0.0.0.0", "-p", "8388", "-k", "password", "-m", "chacha20-ietf-poly1305", "-t", "60"]
