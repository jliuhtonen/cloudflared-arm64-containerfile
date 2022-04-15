.PHONY: clean image

image: cloudflared-linux-arm64.deb
	podman build --platform linux/arm64 -t cloudflared-dnsproxy .

clean:
	rm cloudflared-linux-arm64.deb

cloudflared-linux-arm64.deb:
	$(shell scripts/get-deb.sh)

