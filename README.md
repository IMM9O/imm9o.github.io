# My Technical blog websites were built with 💖 using [Astro](https://github.com/satnaing/astro-paper) and hosted on GitHub pages 🐱

## Run with Docker

Build and run the production site (nginx) on <http://localhost:8080>:

```bash
docker compose up --build web
```

Run the dev server with live reload on <http://localhost:4321>:

```bash
docker compose up app
```

Use the published image without the source code:

```bash
docker run --rm -p 8080:80 ghcr.io/imm9o/imm9o.github.io:latest
```

The `Docker image` workflow publishes this image on each push to `master`.
