# Docker Image - GAM command line management for Google G Suite

[GAM](https://github.com/jay0lee/GAM) is a command line tool for Google G Suite Administrators to manage domain and user settings quickly and easily.

* Visit the [Wiki pages](https://github.com/jay0lee/GAM/wiki) for instructions and examples

---

## Docker

### Supported tags and Dockerfile

- `latest` [(Dockerfile)](https://github.com/nwesd/docker_gam/blob/master/Dockerfile)


### Pull  

Get the latest version:
```
docker pull docker.io/nwesd/gam:latest
```

### Run

Generate the required credential files (see the documentation)

- `oauth2.txt`
- `oauth2service.json`
- `client_secrets.json`

```
docker run -it --rm \
       -v "${PWD}"/oauth2.txt:/gam/oauth2.txt:ro \
       -v "${PWD}"/oauth2service.json:/gam/oauth2service.json:ro \
       -v "${PWD}"/client_secrets.json:/gam/client_secrets.json:ro \
       --name gam docker.io/nwesd/gam:latest
```

