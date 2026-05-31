FROM alpine:latest

# Installation de V2Ray comme dans ton script
RUN apk add --no-cache v2ray

# Copie de la configuration
COPY config.json /etc/v2ray/config.json

# Port requis par Google Cloud Run
ENV PORT=8080
EXPOSE 8080

# Lancement
CMD ["v2ray", "run", "-config", "/etc/v2ray/config.json"]
