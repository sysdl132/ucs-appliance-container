# echo bootstrap

# VERSION="5.0-0"; \
#   time sudo /bin/bash bootstrap/bootstrap.sh \
#     --use-cache \
#     --arch amd64 \
#     --distribution univention-corporate-server \
#     --codename ucs$(echo ${VERSION} | tr --complement --delete '[:digit:]')

echo docker

VERSION="5.0-0"; IMAGE="univention/univention-corporate-server-debootstrap"; TAG="latest"; \
  time docker build \
    --build-arg DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
    --build-arg VERSION=${VERSION} \
    --build-arg COMMENT="$(docker image inspect --format '{{.Comment}}' ${IMAGE}:${TAG})" \
    --build-arg IMAGE=${IMAGE} \
    --build-arg TAG=${TAG} \
    --tag univention-corporate-server:${VERSION} \
    --tag univention-corporate-server:${TAG} .
