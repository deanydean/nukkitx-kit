#!/bin/bash
# Entrypoint script for the nukkitx-kit container
set -o errexit -o nounset -o pipefail

: ${NUKKITX_KIT_HOME="/nukkitx-kit"}
: ${NUKKITX_JAR="nukkit-1.0-SNAPSHOT.jar"}

# Create the var dir if needed (it might already exist)
mkdir -p ${NUKKITX_KIT_HOME}/var

# If the jar is missing, re-download it now.
if [ ! -f "${NUKKITX_KIT_HOME}/var/${NUKKITX_JAR}" ]
then
    NUKKITX_JAR="${NUKKITX_JAR}"
        /opt/nukkitx-kit/scripts/download-nukkitx-jar.sh
fi

pushd ${NUKKITX_KIT_HOME}/var
    echo "Starting nukkitx...."
    java -jar ${NUKKITX_JAR} --language "${NUKKITX_LANG}"
    echo "Nukkitx ended."
popd