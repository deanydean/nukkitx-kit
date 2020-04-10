#
# Dockerfile to create a nukkitx-kit Minecraft server container image
#
FROM openjdk:8-jre-buster

# Add the nukkitx-kit scripts
ADD scripts /opt/nukkitx-kit/scripts

# The location in the container for nukkitx-kit content
ENV NUKKITX_KIT_HOME="/nukkitx-kit"
# The nukkitx build number to download into new containers
ENV NUKKITX_BUILD="latest"
# The language for the nukkitx server
ENV NUKKITX_LANG="eng"

WORKDIR "${NUKKITX_KIT_HOME}/var"
ENTRYPOINT [ "/opt/nukkitx-kit/scripts/docker-entrypoint.sh" ]