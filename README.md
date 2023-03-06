# Statically linked tar

Statically linked [Tar] container image with [Bash]

> 1,7M (1,1M bash)

```bash
ghcr.io/awesome-containers/static-tar:latest
ghcr.io/awesome-containers/static-tar:1.34

docker.io/awesomecontainers/static-tar:latest
docker.io/awesomecontainers/static-tar:1.34
```

Slim statically linked [Tar] container image with [Bash] stripped and
packaged with [UPX]

> 950K (578K bash)

```bash
ghcr.io/awesome-containers/static-tar:latest-slim
ghcr.io/awesome-containers/static-tar:1.34-slim

docker.io/awesomecontainers/static-tar:latest-slim
docker.io/awesomecontainers/static-tar:1.34-slim
```

[Tar]: https://www.gnu.org/software/tar/
[Bash]: https://github.com/awesome-containers/static-bash
[UPX]: https://upx.github.io/

<!--
```bash
image="localhost/${PWD##*/}"

podman build -t "$image:latest" .
podman build -t "$image:latest-slim" -f Containerfile-slim \
  --build-arg STATIC_TAR_IMAGE="$image" \
  --build-arg STATIC_TAR_VERSION=latest --no-cache .

echo "$image:latest"
podman inspect "$image:latest" | jq '.[].Size' | numfmt --to=iec
echo "$image:latest-slim"
podman inspect "$image:latest-slim" | jq '.[].Size' | numfmt --to=iec

```
-->
