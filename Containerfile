# https://github.com/awesome-containers/static-bash
ARG STATIC_BASH_VERSION=5.2.15
ARG STATIC_BASH_IMAGE=ghcr.io/awesome-containers/static-bash

# https://github.com/awesome-containers/alpine-build-essential
ARG BUILD_ESSENTIAL_VERSION=3.17
ARG BUILD_ESSENTIAL_IMAGE=ghcr.io/awesome-containers/alpine-build-essential


FROM $STATIC_BASH_IMAGE:$STATIC_BASH_VERSION AS static-bash
FROM $BUILD_ESSENTIAL_IMAGE:$BUILD_ESSENTIAL_VERSION AS build

# https://git.savannah.gnu.org/cgit/tar.git
ARG TAR_VERSION=1.34

WORKDIR /src/tar
RUN set -xeu; \
    curl -#Lo tar.tar.xz \
        "https://ftp.gnu.org/gnu/tar/tar-$TAR_VERSION.tar.xz"; \
    tar -xvf tar.tar.xz --strip-components=1; \
    rm -f tar.tar.xz

ARG FORCE_UNSAFE_CONFIGURE=1
ARG CFLAGS='-w -g -Os -static'
RUN set -xeu; \
    ./configure; \
    make -j"$(nproc)"; \
    strip -s -R .comment --strip-unneeded src/tar; \
    chmod -cR 755 src/tar; \
    chown -cR 0:0 src/tar; \
    ! ldd src/tar && :; \
    ./src/tar --version

# static tar image
FROM static-bash
COPY --from=build /src/tar/src/tar /bin/
