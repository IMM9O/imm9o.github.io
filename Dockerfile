# Production image: build the static site with Node, serve it with nginx.
# Build: docker build -t imm9o-blog .
# Run:   docker run --rm -p 8080:80 imm9o-blog   ->  http://localhost:8080

# dev: packages only. docker compose mounts the source over /app and runs the dev server.
FROM node:20-bookworm-slim AS dev
WORKDIR /app
COPY package.json package-lock.json ./
# Skip husky's git hooks: the image has no .git folder.
ENV HUSKY=0
RUN npm ci --no-audit --no-fund
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

FROM dev AS build
COPY . .
RUN npm run build

FROM nginx:1.27-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK CMD wget -q -O /dev/null http://localhost/ || exit 1
