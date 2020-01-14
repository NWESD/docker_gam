FROM docker.io/library/debian:buster-slim

LABEL maintainer="Chris	Francy <zoredache@gmail.com>"

RUN apt-get update \
 && apt-get -y --no-install-recommends install wget xz-utils ca-certificates

RUN mkdir /gam \
 && wget -nv -O /gam/gam-linux-x86_64-glibc2.27.tar.xz \
    https://github.com/jay0lee/GAM/releases/download/v4.97/gam-4.97-linux-x86_64-glibc2.27.tar.xz \
 && echo "a14f1cf8b47454c8bbf1ff290c18477ac5867b1af5a3493dbe8c78428acf9c4b /gam/gam-linux-x86_64-glibc2.27.tar.xz" | \
    sha256sum --check \
 && tar xvf /gam/gam-linux-x86_64-glibc2.27.tar.xz --strip-components=1 -C /gam gam

WORKDIR /gam
ENTRYPOINT ["/gam/gam"]
CMD [""]
