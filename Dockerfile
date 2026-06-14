FROM teddysun/xray:latest

# Copie de la configuration
COPY config.json /etc/xray/config.json

# Port requis par Google Cloud Run
ENV PORT=8080
EXPOSE 8080

# LE SECRET DE PERFORMANCE POUR QWIKLABS :
# On bride la mémoire du Garbage Collector de Go à 400 Mo pour ne jamais dépasser la limite des 512 Mo de l'instance
ENV GOMEMLIMIT=400MiB
ENV GOMAXPROCS=1

# Lancement (L'image teddysun n'a pas d'entrypoint bloquant)
CMD ["xray", "run", "-config", "/etc/xray/config.json"]
