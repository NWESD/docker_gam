FROM docker.io/library/debian:buster-slim

LABEL maintainer="Chris	Francy <zoredache@gmail.com>"

RUN apt-get update \
 && apt-get -y --no-install-recommends install wget xz-utils ca-certificates

RUN mkdir /gam \
 && wget -nv -O /gam/gam-linux-x86_64-glibc2.27.tar.xz \
    https://github.com/jay0lee/GAM/releases/download/v4.96/gam-4.96-linux-x86_64-glibc2.27.tar.xz \
 && echo "24f9d52809ca02c4673ccdf62224d1fc50ff75a34c17a57c001382f2298cfc58 /gam/gam-linux-x86_64-glibc2.27.tar.xz" | \
    sha256sum --check \
 && tar xvf /gam/gam-linux-x86_64-glibc2.27.tar.xz --strip-components=1 -C /gam gam

WORKDIR /gam
ENTRYPOINT ["/gam/gam"]
CMD [""]
