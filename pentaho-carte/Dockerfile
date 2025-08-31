# image de base légère
FROM openjdk:11-jre-slim

# option JVM par défaut
ENV PENTAHO_DI_JAVA_OPTIONS="-Xms512m -Xmx2g -Dfile.encoding=UTF-8"

# dépendances minimales
RUN apt-get update \
 && apt-get install -y --no-install-recommends unzip ca-certificates bash tzdata \
 && rm -rf /var/lib/apt/lists/*

# copier l'archive PDI depuis le contexte build
COPY zip/pdi-ce-9.4.0.0-343.zip /tmp/pdi.zip

# installer PDI et rendre les scripts exécutables
RUN set -eux; \
    mkdir -p /opt; \
    unzip -q /tmp/pdi.zip -d /opt; \
    mv /opt/data-integration /opt/pdi; \
    rm -f /tmp/pdi.zip; \
    find /opt/pdi -type f -name "*.sh" -exec chmod +x {} \; ; \
    rm -rf /opt/pdi/plugins/pentaho-googledrive-vfs* || true

# wrapper et config
COPY start-carte.sh /usr/local/bin/start-carte
COPY carte-config.xml /opt/pdi/carte-config.xml
RUN chmod +x /usr/local/bin/start-carte

# dossier de travail par défaut
WORKDIR /opt/pdi

# processus principal
ENTRYPOINT ["/usr/local/bin/start-carte"]