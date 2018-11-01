FROM openjdk:8-alpine

MAINTAINER Dave <fppowei@gmail.com>

ENV INSTALL_PATH=/usr/local
ENV SMARTFOX_VERSION 2_13_0
ENV SMARTFOX_PATCH_VERSION 2.13.4

WORKDIR ${INSTALL_PATH}

RUN apk add --update --no-cache zip && \
    wget https://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
    wget https://www.smartfoxserver.com/downloads/sfs2x/patches/SFS2X-Patch-${SMARTFOX_PATCH_VERSION}.zip && \
    tar xf SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
    unzip SFS2X-Patch-${SMARTFOX_PATCH_VERSION}.zip -d SmartFoxServer_2X && \
    rm -r SmartFoxServer_2X/jre SFS2X_unix_${SMARTFOX_VERSION}.tar.gz SFS2X-Patch-${SMARTFOX_PATCH_VERSION}.zip && \
    cd SmartFoxServer_2X/SFS2X-Patch-${SMARTFOX_PATCH_VERSION}/ && \
    sh install-osx.sh && \
    apk del zip 

WORKDIR ${INSTALL_PATH}/SmartFoxServer_2X/SFS2X

ENTRYPOINT ["sh", "sfs2x.sh"]

EXPOSE 8080 8443 9933 9933/udp  

