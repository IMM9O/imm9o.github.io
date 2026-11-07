#!/usr/bin/env bash
# Build the blog's Docker image and run it.
# Usage: ./setup.sh            -> http://localhost:8080, or the next free port up to 8099
#        PORT=3000 ./setup.sh  -> http://localhost:3000 (stops if 3000 is busy)
# It never stops or replaces other containers. It only replaces its own "imm9o-blog" container.
set -euo pipefail

IMAGE="imm9o-blog"
CONTAINER="imm9o-blog"
PORT_FROM_USER="${PORT:-}"
PORT="${PORT:-8080}"

port_in_use() {
  (echo >"/dev/tcp/127.0.0.1/$1") >/dev/null 2>&1
}

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

if port_in_use "${PORT}"; then
  if [ -n "${PORT_FROM_USER}" ]; then
    echo "Port ${PORT} is already in use by another app or container. Choose another one, for example: PORT=8090 ./setup.sh" >&2
    exit 1
  fi
  for candidate in $(seq 8081 8099); do
    if ! port_in_use "${candidate}"; then
      echo "==> Port ${PORT} is busy, using ${candidate} instead"
      PORT="${candidate}"
      break
    fi
  done
  if port_in_use "${PORT}"; then
    echo "Ports 8080 to 8099 are all in use. Run again with a free port, for example: PORT=3000 ./setup.sh" >&2
    exit 1
  fi
fi
URL="http://localhost:${PORT}"

# No restart policy: the container does not start by itself when Docker starts,
# so it never takes a port before your other containers.
echo "==> Starting container ${CONTAINER} on port ${PORT}"
docker run -d --name "${CONTAINER}" -p "${PORT}:80" "${IMAGE}" >/dev/null

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
