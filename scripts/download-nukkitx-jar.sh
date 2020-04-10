#!/bin/bash
# Download the nukkitx jar
set -o errexit -o nounset -o pipefail

set -x

# A full URL for the download of nukkitx
: ${NUKKITX_URL:=""}

# The build and jar-name to download from the nukkitx jenkins server
: ${NUKKITX_BUILD:="latest"}
: ${NUKKITX_JAR:="nukkit-1.0-SNAPSHOT.jar"}

if [ -z "${NUKKITX_URL}" ]
then
    # There's no URL, work it out....
    nukkitx_jenkins_url="https://ci.nukkitx.com/job/NukkitX/job/Nukkit/job/master"

    # Work out the build number....
    if [ -z "${NUKKITX_BUILD}" -o "${NUKKITX_BUILD}" == "latest" ]
    then
        build_number="lastSuccessfulBuild"
    else
        build_number="${NUKKITX_BUILD}"
    fi

    # Create a Jenkins download URL
    NUKKITX_URL="${nukkitx_jenkins_url}/${build_number}/artifact/target/${NUKKITX_JAR}"
fi

echo "Downloading NukkitX jar from ${NUKKITX_URL}...."
curl --output ${NUKKITX_JAR} ${NUKKITX_URL}