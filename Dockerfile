FROM alpine:3.20

LABEL org.opencontainers.image.title="drcnet-243"
LABEL org.opencontainers.image.description="Custom Docker image for Docker Hub"
LABEL org.opencontainers.image.vendor="lubunza"

RUN apk add --no-cache bash ca-certificates tzdata
WORKDIR /app

COPY patch.txt /app/patch.txt

CMD ["sh", "-c", "echo 'Patch:' && cat /app/patch.txt && sleep infinity"]
