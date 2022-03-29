FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y ca-certificates

COPY cloudflared-linux-arm64.deb /tmp
RUN dpkg -i /tmp/cloudflared-linux-arm64.deb
RUN rm /tmp/cloudflared-linux-arm64.deb

RUN useradd -r -s /usr/sbin/nologin -M cloudflared

USER cloudflared
ENTRYPOINT ["cloudflared", "--no-autoupdate"]
CMD ["proxy-dns"]
