FROM docker.io/library/debian:buster-slim

LABEL maintainer="Chris	Francy <zoredache@gmail.com>"

RUN apt-get update \
 && apt-get -y --no-install-recommends install wget xz-utils ca-certificates

RUN mkdir /gam \
 && wget -nv -O /gam/gam-linux-x86_64-glibc2.27.tar.xz \
    https://github.com/jay0lee/GAM/releases/download/v4.98/gam-4.98-linux-x86_64-glibc2.27.tar.xz \
 && echo "ef4ce6b0d824548455cb4d46d1350014c11f9d17d9e2f84086756a5b3a2cce1a /gam/gam-linux-x86_64-glibc2.27.tar.xz" | \
    sha256sum --check \
 && tar xvf /gam/gam-linux-x86_64-glibc2.27.tar.xz --strip-components=1 -C /gam gam \
 && touch /gam/noupdatecheck.txt

WORKDIR /gam
ENTRYPOINT ["/gam/gam"]
CMD [""]
