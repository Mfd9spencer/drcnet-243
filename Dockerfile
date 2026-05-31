FROM teddysun/xray:latest

# Copier le fichier de configuration dans le conteneur
COPY config.json /etc/xray/config.json

# Exposer le port par défaut de Cloud Run
ENV PORT=8080
EXPOSE 8080

# Lancer Xray avec le fichier config
CMD ["xray", "-config", "/etc/xray/config.json"]
