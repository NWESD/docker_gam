FROM docker.io/library/python:3.7-slim-buster

LABEL maintainer="Chris	Francy <zoredache@gmail.com>"

RUN apt-get update \
 && apt-get -y --no-install-recommends install wget xz-utils

RUN mkdir /gam \
 && wget -nv -O /gam/gam-linux-x86_64-glibc2.23.tar.xz \
    https://github.com/jay0lee/GAM/releases/download/v4.94/gam-4.94-linux-x86_64-glibc2.23.tar.xz \
 && echo "ab2e91951fc31dab0573576a6b303bc2bcb8911551123c4ae264355aa52be7dc /gam/gam-linux-x86_64-glibc2.23.tar.xz" | \
    sha256sum --check \
 && tar xvf /gam/gam-linux-x86_64-glibc2.23.tar.xz --strip-components=1 -C /gam gam

WORKDIR /gam
ENTRYPOINT ["/gam/gam"]
CMD [""]
