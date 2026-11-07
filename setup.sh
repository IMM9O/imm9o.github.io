#!/usr/bin/env bash
# Build the blog's Docker image and run it.
# Usage: ./setup.sh            -> http://localhost:8080
#        PORT=3000 ./setup.sh  -> http://localhost:3000
set -euo pipefail

IMAGE="imm9o-blog"
CONTAINER="imm9o-blog"
PORT="${PORT:-8080}"
URL="http://localhost:${PORT}"

cd "$(dirname "$0")"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is not installed. Get it from https://docs.docker.com/get-docker/" >&2
  exit 1
fi
if ! docker info >/dev/null 2>&1; then
  echo "Docker is not running. Start Docker Desktop, then run this script again." >&2
  exit 1
fi

echo "==> Building image ${IMAGE}"
docker build -t "${IMAGE}" .

if docker ps -a --format '{{.Names}}' | grep -qx "${CONTAINER}"; then
  echo "==> Removing old container ${CONTAINER}"
  docker rm -f "${CONTAINER}" >/dev/null
fi

echo "==> Starting container ${CONTAINER} on port ${PORT}"
docker run -d --name "${CONTAINER}" --restart unless-stopped -p "${PORT}:80" "${IMAGE}" >/dev/null

for _ in $(seq 1 30); do
  if curl -fs -o /dev/null "${URL}/"; then
    echo "==> The blog is running at ${URL}"
    echo "    Stop it with: docker rm -f ${CONTAINER}"
    exit 0
  fi
  sleep 1
done

echo "The blog did not answer at ${URL} after 30 seconds. Container logs:" >&2
docker logs "${CONTAINER}" >&2
exit 1
